//
//  RecipeViewModel.swift
//  Yummo
//
//  Created by Seymen Özdeş on 26.03.2024.
//  Binds view to model

import Foundation
import SwiftUI
import PhotosUI

class RecipeViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []
    @Published var path = [Recipe]()
    @Published var showSheet = false
    @Published var recipeImage: UIImage? = nil
    @Published var photosPickerItem: PhotosPickerItem? = nil {
        didSet {
            setImage(from: photosPickerItem)
        }
    }
    
    init() {
        recipes = Recipe.all
    }
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
   private func setImage(from selection: PhotosPickerItem?) {
        guard let selection else { // öncelikle değişkenin nil olup olmadığını kontrol ettik.
            return
        }
        
        Task {
            if let data = try? await selection.loadTransferable(type: Data.self) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.recipeImage = image
                    }
                    return         // Task görev bloğunu durdurdu.
                }
            }
        }
    }
}
