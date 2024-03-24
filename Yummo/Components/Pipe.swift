//
//  Pipe.swift
//  Yummo
//
//  Created by Seymen Özdeş on 23.03.2024.
//

import SwiftUI
// IDK this solution for draw vertical separator line, look path and how to draw vertical line?
struct VerticalDivider: View {
    var body: some View {
        HStack(spacing: 20) {
           Divider().frame(width: 1)
        }
        .padding()
        .frame(width: 22, height: 75) // default width 2
    }
}
