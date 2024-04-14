//
//  RecipeView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 23.03.2024.
//

import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var viewModel: RecipeViewModel
    var recipe: RecipeCard
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 24) {
                Text(recipe.recipeName)
                    .font(.largeTitle).bold()
                
                // recipe info's field + 1.total time should be added
                HStack(spacing: 6) {
                    recipeLabelMaker(iconImage: "person.2.fill", amount: 5, label: "per")
                    
                    VerticalDivider()
                    
                    recipeLabelMaker(iconImage: "timer", amount: 20, label: "Prep")
                    
                    VerticalDivider()
                    
                    recipeLabelMaker(iconImage: "oven.fill", amount: 15, label: "Cook")
                }
                .padding()
                
                // Description section
                descriptionSection
                
                // Ingredients section
                ingredientsSection
                
                // Instruction section
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
    RecipeView(recipe: RecipeCard.all[0])
}
