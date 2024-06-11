//
//  RecipeViewModel.swift
//  Yummo
//
//  Created by Seymen Özdeş on 26.03.2024.
//  Binds view to model

import Foundation
import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []
    @Published var path = [Recipe]()
    @Published var showSheet = false
    
    init() {
        recipes = Recipe.all
    }
    func addRecipe(recipe: Recipe) { 
        recipes.append(recipe)
    }
}
