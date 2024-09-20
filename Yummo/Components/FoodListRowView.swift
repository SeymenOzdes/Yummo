//
//  FoodListRowView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 25.08.2024.
//

import SwiftUI

struct FoodListRowView: View {
    @Binding var isOn: Bool
    var listItem: ShoppingItems
    
    var body: some View {
        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
            .stroke(Color.gray)
            .fill(Color(red: 220 / 255, green: 220 / 255, blue: 230 / 255).opacity(0.3))
            .frame(width: 360, height: 60)
            .overlay {
                HStack() {
                    Toggle(isOn: $isOn) {
                        Text(listItem.name)
                    }
                    .toggleStyle(iOSCheckboxToggleStyle())
                    .foregroundStyle(Color.black)
                    .padding()
                    
                    Spacer()
                }
            }
    }
}
