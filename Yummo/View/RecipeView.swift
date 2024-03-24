//
//  RecipeView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 23.03.2024.
//

import SwiftUI

struct RecipeView: View {
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 24) {
                Text("Croissant")
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
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas et dolor sapien. Curabitur quis tellus tellus.")
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
                HStack(spacing: 4) {
                    Text("1 cup") // amount
                    Text("Water") // food's name
                }
                HStack(spacing: 4) {
                    Text("4")
                    Text("Carrot")
                }
                HStack(spacing: 4) {
                    Text("2")
                    Text("Steak")
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
                HStack {
                    Text("1") // step nums
                        .foregroundStyle(.secondary)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                }
                HStack {
                    Text("2") // step nums
                        .foregroundStyle(.secondary)
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
                }
            }
        }
        .padding()
    }
}

#Preview {
    RecipeView()
}
