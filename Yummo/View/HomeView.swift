//
//  ContentView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 19.03.2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                AddingRecipeView()
            } label: {
                Image(systemName: "plus")
            }
            
            Spacer()
            
        }
        .navigationTitle("Yummo")
    }
}
    
#Preview {
    HomeView()
}
