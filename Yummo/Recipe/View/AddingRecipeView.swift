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
    @State private var ingredientNum = 1
    @State private var ingredientNums: Array<Int> = []
    @State private var instructionNums: Array<Int> = []
    @State private var ingredients: [Int : String] = [:]
    @State private var instruction: [Int : String] = [:]
    private let times: [Int16] = [5, 10, 15, 20, 30, 40, 50, 60, 70, 80, 90, 100]

    var body: some View {
        NavigationStack {
            Form {
                titleSection
                                
                imageSection
                
                PickerSection(title: "Number of People", selection: $servings)
                
                PickerSection(title: "choose preperation time", selection: $selectedPrepTime, times: times)
                
                PickerSection(title: "choose cooking time", selection: $selectedCookTime, times: times)
                
                descriptionSection
                
                ingredientSection
                
                instructionSection
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        viewModel.showSheet.toggle()
                        
                        viewModel.addRecipeCoreData(
                            recipeName: recipeName,
                            recipeDesc: description,
                            recipePrepTime: selectedPrepTime,
                            recipeCookingTime: selectedCookTime,
                            recipeServings: servings,
                            ingredients: ingredients,
                            instructions: instruction
                        )
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
                .titleModifier()
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
    var descriptionSection: some View {
        Section {
            TextEditor(text: $description)
                .frame(height: 120)
        } header: {
            Text("Description")
                .titleModifier()
        }
    }
    var ingredientSection: some View {
        Section {
            ForEach(ingredients.sorted(by: <), id: \.key) { key, value in
                TextField("ingredient", text: Binding(get: {
                    ingredients[key] ?? ""
                }, set: { newValue in
                    ingredients[key] = newValue
                }))
            }
        } header: {
            HStack() {
                Text("Ingredients")
                    .titleModifier()
                
                Spacer()
                
                Button {
                    let newIngredient = ""
                    ingredients[ingredientNum] = newIngredient
                    ingredientNums.append(ingredientNum)
                    ingredientNum += 1
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
    var instructionSection: some View {
        Section {
            ForEach(instruction.sorted(by: <), id: \.key) { key, value in
                HStack {
                    Text("\(key)")
                    
                    TextEditor(text: Binding(
                        get: { instruction[key] ?? "" },
                        set: { newValue in instruction[key] = newValue }
                    ))
                }
            }
        } header: {
            HStack {
                Text("Instructions")
                    .titleModifier()
                
                Spacer()
                
                Button {
                    let newInstruction = ""
                    instruction[instructionNum] = newInstruction
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
