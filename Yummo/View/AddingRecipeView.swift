//
//  AddingRecipeView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 24.03.2024.
//

import SwiftUI

struct AddingRecipeView: View {
    @State private var recipeName = ""
    @State private var description = ""
    @State private var selectedPerCount = 1
    @State private var selectedPrepTime = 0
    @State private var selectedCookTime = 5
    @State private var selectedIngredientCount = 1
    @State private var selectedIngredient = ""
    @State private var ingredientCount = 1
    @State private var ingredients: Array<String> = []
    private let times = [5, 10, 15, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    
    
    var body: some View {
        Form {
            // title section
            Section {
                TextField("Name", text: $recipeName)
            } header: {
                Text("Title")
                    .textCase(.none)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.black)
            }
            // number of people section
            Section {
                Picker("Number of People", selection: $selectedPerCount) {
                    ForEach(1..<11, id: \.self) { i in
                        Text("\(i)")
                    }
                }
            } header: {
                Text("Serving")
                    .textCase(.none)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.black)
            }
            // prep time
            Section {
                Picker("choose preperation time", selection: $selectedPrepTime) {
                    ForEach(times, id: \.self) { i in
                        Text("\(i)")
                    }
                }
            } header: {
                Text("Prep Time")
                    .textCase(.none)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.black)
            }
            // cooking time
            Section {
                Picker("choose cooking time", selection: $selectedCookTime) {
                    ForEach(times, id: \.self) { i in
                        Text("\(i)")
                    }
                }
            } header: {
                Text("Cooking time")
                    .textCase(.none)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.black)
            }
            // Description section
            Section {
                TextEditor(text: $description)
                    .frame(height: 120)
            } header: {
                Text("Description")
                    .textCase(.none)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.black)
            }
            
            // Ingredients Section
            Section {
                ForEach(ingredients.indices, id: \.self) { index in
                    TextField("ingredient", text: $ingredients[index])
                }
            } header: {
                HStack() {
                    Text("Ingredients")
                        .textCase(.none)
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundStyle(.black)
                    
                    Spacer()
                    
                    Button {
                        ingredients.append(selectedIngredient)
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    AddingRecipeView()
}
