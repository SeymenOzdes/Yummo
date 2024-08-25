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
        TabView {
            RecipeHomeView()
                .tabItem {
                    Label("Recipes", systemImage: "book.pages.fill")
                }
            ShoppingListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet.rectangle.portrait.fill")
                }
            
        }
    }
}
    
#Preview {
    HomeView()
}
