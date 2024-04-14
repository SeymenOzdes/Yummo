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
    @State private var selectedCookTime = 20
    @State private var instructionNum = 1
    @State private var instructionNums: Array<Int> = []
    @State private var ingredients: Array<String> = []
    @State private var instructions: Array<String> = [] // dictionary olmalı
    @State private var instructionTexts: Array<String> = []
    private let times = [5, 10, 15, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    
    var body: some View {
        NavigationStack {
            Form {
                titleSection
                
                servingSection
                
                preperationTimeSection
                
                cookingTimeSection
                
                descriptionSection
                
                ingredientSection
                
                instructionSection
            }
            .toolbar {
                Button("Save") {
                    // saving process -> galiba core data burda eklenicek.
                }
            }
            .navigationTitle("New Recipe")
        }
    }
    var titleSection: some View {
        Section {
            TextField("Name", text: $recipeName)
        } header: {
            Text("Title")
                .textCase(.none)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundStyle(.black)
        }
    }
    var servingSection: some View {
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
                .fontWeight(.heavy)
                .foregroundStyle(.black)
        }
    }
    var preperationTimeSection: some View {
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
                .fontWeight(.heavy)
                .foregroundStyle(.black)
        }
    }
    var cookingTimeSection: some View {
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
                .fontWeight(.heavy)
                .foregroundStyle(.black)
        }
    }
    var descriptionSection: some View {
        Section {
            TextEditor(text: $description)
                .frame(height: 120)
        } header: {
            Text("Description")
                .textCase(.none)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundStyle(.black)
        }
    }
    var ingredientSection: some View {
        Section {
            ForEach(ingredients.indices, id: \.self) { index in
                TextField("ingredient", text: $ingredients[index])
            }
        } header: {
            HStack() {
                Text("Ingredients")
                    .textCase(.none)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)
                
                Spacer()
                
                Button {
                    let newIngredient = ""
                    ingredients.append(newIngredient)
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    var instructionSection: some View {
        Section {
            ForEach(instructions.indices, id: \.self) { i in
                HStack() {
                    Text("\(instructionNums[i])")
                    TextEditor(text: $instructionTexts[i])
                }
            }
        } header: {
            HStack() {
                Text("Instructions")
                    .textCase(.none)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundStyle(.black)
                
                Spacer()
                
                Button {
                    let newInstruction = "" // Burada yeni bir talimat oluştur
                    instructions.append(newInstruction)
                    instructionTexts.append(newInstruction)
                    instructionNums.append(instructionNum)
                    instructionNum += 1
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    AddingRecipeView()
}
