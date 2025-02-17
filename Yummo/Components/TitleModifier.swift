//
//  TitleModifier.swift
//  Yummo
//
//  Created by Seymen Özdeş on 17.02.2025.
//

import Foundation
import SwiftUI

struct TitleModifier: ViewModifier {
    func body (content: Content) -> some View {
        content
            .textCase(.none)
            .font(.title2)
            .bold()
            .foregroundStyle(.black)
    }
}

extension View {
    func titleModifier() -> some View {
        modifier(TitleModifier())
    }
}
