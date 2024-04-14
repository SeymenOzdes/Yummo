//
//  ContentView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 19.03.2024.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var viewModel: RecipeViewModel
    
    var body: some View {
        NavigationStack {
            List(viewModel.recipes) { recipe in
                Text(recipe.recipeName)
                    .navigationTitle("Yummo")
            }
            .toolbar {
                NavigationLink("+", destination: {
                    AddingRecipeView()
                })
                .foregroundStyle(.primary)
                .font(.title)
            }
        }
    }
}
    
#Preview {
    HomeView()
        .environmentObject(RecipeViewModel())
}
