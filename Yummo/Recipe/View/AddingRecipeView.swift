//
//  AddingRecipeView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 24.03.2024.
//
import SwiftUI
import PhotosUI

struct AddingRecipeView: View {
    @EnvironmentObject var viewModel: RecipeViewModel
    
    @State private var recipeName = ""
    @State private var description = ""
    @State private var servings: Int16 = 1
    @State private var selectedPrepTime: Int16 = 5
    @State private var selectedCookTime: Int16 = 20
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
                                
                imageSection
                
                servingSection
                
                preperationTimeSection
                
                cookingTimeSection
                
                descriptionSection
                
                ingredientSection
                
                instructionSection
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.showSheet.toggle()
                       // viewModel.addRecipe(recipe: Recipe(recipeName: recipeName,recipePhoto: viewModel.recipeImage ,servings: servings, preperationTime: selectedPrepTime, cookingTime: selectedCookTime, description: description, ingredients: ingredients, instructions: instructions))
                        
                        viewModel.addRecipeCoreData(recipeName: recipeName, recipeDesc: description, recipePrepTime: selectedPrepTime, recipeCookingTime: selectedCookTime, recipeServings: servings, ingredients: ingredients, instructions: instructions)
                        viewModel.recipeImage = nil

                    } label: {
                        Image(systemName: "checkmark.circle")
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        viewModel.showSheet.toggle()
                        viewModel.recipeImage = nil 
                    }label: {
                        Image(systemName: "xmark.circle")
                    }
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
                .bold()
                .foregroundStyle(.black)
        }
    }
    var imageSection: some View {
        Section {
            HStack {
                if let image = viewModel.recipeImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 52, height: 52)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)))
                }
                PhotosPicker(selection: $viewModel.photosPickerItem, matching: .images) {
                    HStack {
                            Spacer()
                            
                            Image(systemName: "photo")
                                .font(.title)
                            
                            Spacer()
                    }
                }
            }
        }header: {
            Text("Image")
        }
    }
    var servingSection: some View {
        Section {
            Picker("Number of People", selection: $servings) {
                ForEach(1..<11, id: \.self) { i in
                    Text("\(i)")
                        .tag(Int16(i))
                }
            }
        } header: {
            Text("Serving")
                .textCase(.none)
                .font(.title2)
                .bold()
                .foregroundStyle(.black)
        }
    }
    var preperationTimeSection: some View {
        Section {
            Picker("choose preperation time", selection: $selectedPrepTime) {
                ForEach(times, id: \.self) { i in
                    Text("\(i)")
                        .tag(Int16(i))
                }
            }
        } header: {
            Text("Prep Time")
                .textCase(.none)
                .font(.title2)
                .bold()
                .foregroundStyle(.black)
        }
    }
    var cookingTimeSection: some View {
        Section {
            Picker("choose cooking time", selection: $selectedCookTime) {
                ForEach(times, id: \.self) { i in
                    Text("\(i)")
                        .tag(Int16(i))
                }
            }
        } header: {
            Text("Cooking time")
                .textCase(.none)
                .font(.title2)
                .bold()
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
                .bold()
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
                    .bold()
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
                    .bold()
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
        .environmentObject(RecipeViewModel())
}
