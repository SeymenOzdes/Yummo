//
//  ContentView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 19.03.2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = RecipeViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            List {
                ForEach(viewModel.recipes) { recipe in
                    NavigationLink(recipe.recipeName, value: recipe)
                }
            }
            .navigationTitle("Recipes")
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeView(recipe: recipe)
                    .environmentObject(viewModel)
            }
            .toolbar {
                Button {
                    viewModel.showSheet.toggle()
                } label: {
                    Text("+")
                }
                .foregroundStyle(.primary)
                .font(.title)
                .fullScreenCover(isPresented: $viewModel.showSheet, content: {
                    AddingRecipeView()
                        .environmentObject(viewModel)
                })
            }
        }
    }
}
    
#Preview {
    HomeView()
}
