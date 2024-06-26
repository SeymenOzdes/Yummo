//
//  RecipeView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 23.03.2024.
//
import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var viewModel: RecipeViewModel
    var recipe: Recipe
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 24) {
                Text(recipe.recipeName)
                    .font(.largeTitle).bold()
                
                if let image = recipe.recipePhoto {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 360, height: 160)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 16, height: 10)))
                }
                else {
                    ZStack {
                        
                        RoundedRectangle(cornerSize: CGSize(width: 16, height: 10) )
                            .foregroundStyle(Color.gray)
                            .frame(width: 360, height: 160)
                            
                        Image(systemName: "photo")
                            .font(.title)
                            .foregroundStyle(Color.white)
                    }
                }
                
                // recipe info's field + 1.total time should be added
                HStack(spacing: 6) {
                    recipeLabelMaker(iconImage: "person.2.fill", amount: recipe.servings, label: "per")
                    
                    VerticalDivider()
                    
                    recipeLabelMaker(iconImage: "timer", amount: recipe.preperationTime, label: "Prep")
                    
                    VerticalDivider()
                    
                    recipeLabelMaker(iconImage: "oven.fill", amount: recipe.cookingTime, label: "Cook")
                }
                .padding()
                
                descriptionSection
                
                ingredientsSection
                
                instructionSection
            }
            .padding()
        }
        
        Spacer()
        
    }
    func recipeLabelMaker(iconImage: String, amount: Int, label: String) -> some View {
        return Group {
            Image(systemName: iconImage)
            VStack {
                Text("\(amount)")
                Text("\(label)")
                    .foregroundStyle(.secondary)
            }
        }
    }
    var descriptionSection: some View {
        VStack(alignment: .leading) {
            Text("Description")
                .font(.title2)
            
            Divider()
            
            Text(recipe.description)
                .fontWeight(.thin)
                .fontDesign(.monospaced)
        }
        .padding()
    }
    var ingredientsSection: some View {
        VStack(alignment: .leading) {
            Text("Ingredients")
                .font(.title2)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 12) {
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                }
            }
            .padding()
        }
        .padding()
    }
    var instructionSection: some View {
        VStack(alignment: .leading) {
            Text("Instruction")
                .font(.title2)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 12) {
                ForEach(recipe.instructions, id: \.self) {instruction in
                    Text(instruction)
                }
            }
        }
        .padding()
    }
}
#Preview {
    RecipeView(recipe: Recipe.all[0])
}
