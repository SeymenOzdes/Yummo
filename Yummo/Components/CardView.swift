//
//  CardView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 10.06.2024.
//
// 1.default olarak heigth ve width değişkenleri oluştur.

import SwiftUI

struct CardView: View {
    var recipe: Recipe
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
            .frame(width: 300, height: 144)
            .foregroundStyle(Color.black)
            .overlay(alignment: .center) {
                HStack(alignment: .center, spacing: 44) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(recipe.recipeName)
                            .foregroundStyle(Color.white)
                            .font(.headline)
                                                    
                        HStack(alignment: .center) {
                            HStack(spacing: 4){
                                Text("\(recipe.servings)")
                                Image(systemName: "person.2.fill")
                            }
                            
                            HStack(spacing: 4) {
                                Text("\(recipe.preperationTime)")
                                Image(systemName: "timer")
                            }
                            
                            HStack(spacing: 4) {
                                Text("\(recipe.cookingTime)")
                                Image(systemName: "oven.fill")
                            }
                        }
                        .foregroundStyle(Color.white)
                        .font(.caption)
                    }
                    
                    Spacer()
                    
                    if let image = recipe.recipePhoto {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 92, height: 92)
                    }
                }
                .padding(.horizontal, 22)
            }
    }
}


