//
//  Recipe.swift
//  Yummo
//
//  Created by Seymen Özdeş on 26.03.2024.
// All Logic + data here.

import Foundation
import UIKit

struct Recipe: Identifiable, Hashable {
    let id = UUID()
    var recipeName: String
    var recipePhoto: UIImage?
    var servings: Int16
    var preperationTime: Int16
    var cookingTime: Int16
    var description: String
    var ingredients: [Int : String]
    var instructions: [Int : String]
    
    init(entity: RecipeEntity) {
        self.recipeName = entity.recipeName ?? ""
        self.servings = entity.servings
        self.preperationTime = entity.preperationTime
        self.cookingTime = entity.cookingTime
        self.description = entity.recipeDescription ?? ""
        self.ingredients = entity.ingredients as? [Int : String] ?? [:]
        self.instructions = entity.instructions as? [Int : String] ?? [:]
    }
}
