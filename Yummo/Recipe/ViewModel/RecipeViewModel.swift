//
//  RecipeViewModel.swift
//  Yummo
//
//  Created by Seymen Özdeş on 26.03.2024.
//  Binds view to model

import Foundation
import SwiftUI
import PhotosUI
import CoreData

class RecipeViewModel: ObservableObject {
    // @Published private(set) var recipes: [Recipe] = []
    
    @Published var path = [Recipe]()
    @Published var showSheet = false
    @Published var recipeImage: UIImage? = nil
    @Published var photosPickerItem: PhotosPickerItem? = nil {
        didSet {
            setImage(from: photosPickerItem)
        }
    }
    
    // core data
    @Published var savedEntities: [RecipeEntity] = []
    let container: NSPersistentContainer
    
    init() {
        // recipes = Recipe.mockData
        
        container = NSPersistentContainer(name: "RecipeDataModel")
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data failed to load: \(error.localizedDescription)")
            }
        }
        fetchRequest()
    }
    
    func fetchRequest() {
        let request = NSFetchRequest<RecipeEntity>(entityName: "RecipeEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error{
            print("error fetching \(error)")
        }
    }
    // sadece recipeEntity oluşturuyor. Veritabanına kaydetme işlemini save data yapıyor.
    func addRecipeCoreData(recipeName: String, recipeDesc: String,
                       recipePrepTime: Int16, recipeCookingTime: Int16,
                       recipeServings: Int16, ingredients: [String], instructions: [String]) {
        
        let newRecipeEntity = RecipeEntity(context: container.viewContext)
        newRecipeEntity.recipeName = recipeName
        newRecipeEntity.recipeDescription = recipeDesc
        newRecipeEntity.preperationTime = recipePrepTime
        newRecipeEntity.cookingTime = recipeCookingTime
        newRecipeEntity.servings = recipeServings
        newRecipeEntity.ingredients = ingredients as NSArray
        newRecipeEntity.instructions = instructions as NSArray
        
  
        SaveData()
    }
    func SaveData() {
        do {
            try container.viewContext.save()
            fetchRequest()
        } catch let error {
            print("Error saving data: \(error.localizedDescription)")
        }
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
//func addRecipe(recipe: Recipe) {
 //   recipes.append(recipe)
// }
