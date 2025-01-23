//
//  RecipeHomeView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 25.08.2024.
//

import SwiftUI

struct RecipeHomeView: View {
    @StateObject var viewModel = RecipeViewModel()
    
    var body: some View {
        NavigationStack(path: $viewModel.path) {
            ScrollView(.horizontal) {
                LazyHStack(spacing: 26) {
                    ForEach(viewModel.savedEntities, id: \.self) { recipeEntity in
                        let recipe = Recipe(entity: recipeEntity)
                        NavigationLink(value: recipe) {
                            CardView(recipe: recipe)
                                .contextMenu {
                                    Button {
                                        viewModel.deleteRecipe(recipe: recipeEntity)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                    }
                }
                // lazy view yüzünden ekranın dışında daha var olmayan objeleri layout belirler ve scrollview'in doğru yere kaydırılmasını sağlar.
                .scrollTargetLayout()
            }
            .safeAreaPadding(.horizontal, 46)
            .scrollTargetBehavior(.paging)
            .scrollIndicators(.hidden)
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
    RecipeHomeView()
}
