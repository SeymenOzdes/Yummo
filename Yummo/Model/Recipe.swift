//
//  Recipe.swift
//  Yummo
//
//  Created by Seymen Özdeş on 26.03.2024.
// All Logic + data here.

import Foundation
import UIKit

struct Recipe: Identifiable, Hashable {   // instructionText eklenebilir.
    let id = UUID()
    var recipeName: String
    var recipePhotos: UIImage?
    var servings: Int
    var preperationTime: Int
    var cookingTime: Int
    var description: String
    var ingredients: Array<String>
    var instructions: Array<String>
}
// MARK: - Mock Data
extension Recipe {
    static let all: [Recipe] = [
        Recipe(
                   recipeName: "Coq au Vin",
                   recipePhotos: nil,
                   servings: 4,
                   preperationTime: 20,
                   cookingTime: 120,
                   description: "Coq au Vin is a traditional French dish made with chicken, mushrooms, and red wine.",
                   ingredients: [
                    "1 whole chicken (about 3 lbs)",
                    "7 oz bacon (diced)",
                    "7 oz mushrooms (sliced)",
                    "2 onions (finely chopped)",
                    "4 cloves garlic (minced)",
                    "2 tbsp butter",
                    "2 tbsp all-purpose flour",
                    "1 bottle (750 ml) red wine",
                    "1 cup chicken broth",
                    "2 bay leaves",
                    "2 sprigs fresh thyme",
                    "Salt and pepper to taste"
                   ],
                   instructions: [
                    "Cut the chicken into pieces and season with salt and pepper.",
                    "In a large Dutch oven, melt the butter over medium heat. Add the chicken pieces and brown them on all sides. Remove the chicken and set aside.",
                    "In the same pot, add the diced bacon and cook until crisp. Add the chopped onions and cook until softened. Add the minced garlic and cook until fragrant.",
                    "Sprinkle the flour over the bacon and onion mixture, and cook for 1-2 minutes.",
                    "Pour in the red wine and chicken broth, and bring to a simmer. Add the bay leaves and fresh thyme.",
                    "Return the chicken to the pot. Cover and simmer over low heat for about 1.5 hours, or until the chicken is tender.",
                    "In the last 30 minutes of cooking, add the sliced mushrooms.",
                    "Once done, season with salt and pepper to taste. Serve hot."
                   ]
                  ),
        Recipe(
            recipeName: "Beef Bourguignon",
            recipePhotos: nil,
            servings: 6,
            preperationTime: 30,
            cookingTime: 180,
            description: "Beef Bourguignon is a classic French stew made with tender beef, red wine, mushrooms, and pearl onions.",
            ingredients: [
                "2 lbs beef chuck, cut into 1-inch cubes",
                "6 oz bacon, diced",
                "1 lb mushrooms, quartered",
                "20 pearl onions, peeled",
                "4 cloves garlic, minced",
                "2 tbsp olive oil",
                "2 cups red wine",
                "2 cups beef broth",
                "2 tbsp tomato paste",
                "2 bay leaves",
                "4 sprigs fresh thyme",
                "Salt and pepper to taste"
            ],
            instructions: [
                "Season the beef cubes with salt and pepper.",
                "In a large Dutch oven, heat the olive oil over medium heat. Add the bacon and cook until crisp. Remove the bacon and set aside.",
                "In the same pot, brown the beef cubes in batches. Remove and set aside.",
                "Add the mushrooms and pearl onions to the pot and cook until golden brown.",
                "Add the minced garlic and cook until fragrant.",
                "Stir in the tomato paste and cook for 1-2 minutes.",
                "Pour in the red wine and beef broth. Add the bay leaves, thyme, and cooked bacon.",
                "Return the beef to the pot. Cover and simmer over low heat for about 2.5 hours, or until the beef is tender.",
                "Once done, season with salt and pepper to taste. Serve hot."
            ]
        ),
        Recipe(
            recipeName: "Ratatouille",
            recipePhotos: nil,
            servings: 4,
            preperationTime: 20,
            cookingTime: 60,
            description: "Ratatouille is a traditional French Provencal vegetable stew.",
            ingredients: [
                "1 eggplant, diced",
                "2 zucchinis, diced",
                "1 red bell pepper, diced",
                "1 yellow bell pepper, diced",
                "1 onion, diced",
                "2 cloves garlic, minced",
                "4 tomatoes, diced",
                "2 tbsp olive oil",
                "2 tsp dried thyme",
                "2 tsp dried oregano",
                "Salt and pepper to taste"
            ],
            instructions: [
                "In a large skillet, heat the olive oil over medium heat.",
                "Add the diced onion and cook until softened.",
                "Add the minced garlic and cook until fragrant.",
                "Add the diced eggplant, zucchinis, and bell peppers. Cook until slightly softened.",
                "Stir in the diced tomatoes, dried thyme, and dried oregano.",
                "Cover and simmer over low heat for about 45 minutes, stirring occasionally.",
                "Once done, season with salt and pepper to taste. Serve hot or cold."
            ]
        ),
        Recipe(
            recipeName: "French Onion Soup",
            recipePhotos: nil,
            servings: 4,
            preperationTime: 15,
            cookingTime: 60,
            description: "French Onion Soup is a hearty soup made with caramelized onions, beef broth, and topped with melted cheese.",
            ingredients: [
                "4 large onions, thinly sliced",
                "4 tbsp butter",
                "4 cups beef broth",
                "1 cup red wine",
                "4 slices French bread",
                "1 cup grated Gruyere cheese",
                "Salt and pepper to taste"
            ],
            instructions: [
                "In a large pot, melt the butter over medium heat.",
                "Add the thinly sliced onions and cook until caramelized, about 30-40 minutes.",
                "Pour in the beef broth and red wine. Bring to a simmer and cook for an additional 15-20 minutes.",
                "Meanwhile, toast the French bread slices under the broiler until golden brown.",
                "Ladle the soup into oven-safe bowls. Top each bowl with a slice of toasted French bread and a generous amount of grated Gruyere cheese.",
                "Place the bowls under the broiler until the cheese is melted and bubbly.",
                "Serve hot."
            ]
        ),
        Recipe(
            recipeName: "Quiche Lorraine",
            recipePhotos: nil, 
            servings: 6,
            preperationTime: 30,
            cookingTime: 45,
            description: "Quiche Lorraine is a savory tart made with a pastry crust filled with eggs, cream, bacon, and cheese.",
            ingredients: [
                "1 pie crust (homemade or store-bought)",
                "6 slices bacon, cooked and crumbled",
                "1 cup shredded Gruyere cheese",
                "4 eggs",
                "1 cup heavy cream",
                "1/2 cup milk",
                "1/4 tsp nutmeg",
                "Salt and pepper to taste"
            ],
            instructions: [
                "Preheat the oven to 375°F (190°C).",
                "Line a pie dish with the pie crust. Trim the edges and prick the bottom with a fork.",
                "Spread the cooked and crumbled bacon and shredded Gruyere cheese over the bottom of the pie crust.",
                "In a mixing bowl, whisk together the eggs, heavy cream, milk, nutmeg, salt, and pepper.",
                "Pour the egg mixture over the bacon and cheese in the pie crust.",
                "Bake in the preheated oven for about 40-45 minutes, or until the quiche is set and the crust is golden brown.",
                "Allow to cool slightly before slicing and serving."
            ]
        )
    ]
}
