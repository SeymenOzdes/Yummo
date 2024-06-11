//
//  CardView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 10.06.2024.
//
// 1.default olarak heigth ve width değişkenleri oluştur.

import SwiftUI

struct CardView: View {
    var body: some View {
            RoundedRectangle(cornerSize: CGSize(width: 20, height: 20))
                .frame(width: 300, height: 144)
                .overlay(alignment: .center) {
                    Text("Hello, World!")
                        .foregroundStyle(Color.white)
                }
                
    }
}

#Preview {
    CardView()
}
