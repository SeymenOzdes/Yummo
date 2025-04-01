//
//  ContentView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 19.03.2024.
//
import SwiftUI

struct HomeView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView (selection: $selectedTab){
                RecipeHomeView()
                    .tag(1)
                    
                ShoppingListView()
                    .tag(2)
            }
            
            CustomTabBar(selectedTab: $selectedTab)
                .padding(.bottom, 12)
        }
    }
}
