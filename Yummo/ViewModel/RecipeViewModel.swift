//
//  RecipeViewModel.swift
//  Yummo
//
//  Created by Seymen Özdeş on 26.03.2024.
// Binds view to model

import Foundation

class RecipeViewModel: ObservableObject {
    @Published private(set) var recipes: [RecipeCard] = []
    
    init() {
        recipes = RecipeCard.all
    }
}
