//
//  Recipe.swift
//  Yummo
//
//  Created by Seymen Özdeş on 26.03.2024.
// All Logic + data here.

import Foundation

struct Recipe {
    private(set) var recipes: Array<RecipeCard> // only setter, people can see it but doesnt change it.
    
    struct RecipeCard {
        var recipeName: String
        var servings: Int
        var preperationTime: Int
        var cookingTime: Int
        var description: String
        var ingredients: Array<String>
        var instructions: Array<String> // instructionText eklenebilir.
    }
}
