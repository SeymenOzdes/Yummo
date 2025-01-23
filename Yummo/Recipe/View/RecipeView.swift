//
//  RecipeView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 23.03.2024.
//
import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    @EnvironmentObject var viewModel: RecipeViewModel
    
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
    func recipeLabelMaker(iconImage: String, amount: Int16, label: String) -> some View {
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
                .foregroundStyle(.orange)
            
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
                .foregroundStyle(.indigo)
            
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
                .foregroundStyle(.mint)
            
            Divider()
            
            VStack(alignment: .leading, spacing: 6) {
                ForEach(recipe.instructions.sorted(by: <), id: \.key) {key, value in
                    HStack(spacing: 6) {
                        ZStack(alignment: .center) {
                            Circle()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(Color.orange.secondary.opacity(0.82))
                            
                            Text("\(key)")
                                .foregroundStyle(.orange)
                                .fontWeight(.black)
                        }
                        
                        
                            // buraya eklenicek.
                        Text("\(value)")
                    }
                }
            }
        }
        .padding()
    }
}
