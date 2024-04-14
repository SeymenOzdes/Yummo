//
//  YummoApp.swift
//  Yummo
//
//  Created by Seymen Özdeş on 19.03.2024.
//

import SwiftUI

@main
struct YummoApp: App {
    @StateObject var recipeViewModel = RecipeViewModel()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(recipeViewModel)
        }
    }
}
