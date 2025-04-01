//
//  CustomTabBar.swift
//  Yummo
//
//  Created by Seymen Özdeş on 30.03.2025.
//

import SwiftUI

struct CustomTabBar: View {
    private let tabs = TabItem.mockItems
    @Namespace private var animationNamespace
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack(spacing: 20) {
            ForEach(tabs) { tab in
                Button {
                    selectedTab = tab.tag
                } label: {
                    HStack {
                        Image(systemName: tab.icon)
                            .font(.system(size: 24))
                            .frame(width: 24, height: 24)
                            .foregroundStyle(selectedTab == tab.tag ? .yellow : .black)
                            .matchedGeometryEffect(id: "ICON_\(tab.tag)", in: animationNamespace)
                        
                        if selectedTab == tab.tag {
                            Text(tab.title)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.orange)
                        }
                    }
                    .padding(.horizontal, 12)
                    .background {
                        if selectedTab == tab.tag {
                            Capsule()
                                .fill(Color.orange.opacity(0.2))
                                .matchedGeometryEffect(id: "TAB", in: animationNamespace)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background {
            Capsule()
                .stroke(Color.orange.opacity(0.3), lineWidth: 2)
                .fill(Color.white)
                .shadow(color: Color.gray,
                        radius: 20
                )
        }
         .padding(.horizontal)
         .animation(.spring(response: 0.8, dampingFraction: 0.7), value: selectedTab)
    }
}
