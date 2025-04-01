//
//  TabItem.swift
//  Yummo
//
//  Created by Seymen Özdeş on 30.03.2025.
//

import Foundation

struct TabItem: Identifiable {
    let id: UUID = UUID()
    let icon: String
    let title: String
    let tag: Int
    
    public static let mockItems: [TabItem] = [
        TabItem(icon: "book.fill", title: "Recipe", tag: 1),
        TabItem(icon: "list.bullet.rectangle.portrait.fill", title: "List", tag: 2)
    ]
}

