//
//  ListItem.swift
//  Yummo
//
//  Created by Seymen Özdeş on 25.08.2024.
//

import Foundation

struct ShoppingItems: Identifiable, Hashable {
    var id = UUID()
    var name: String
}

extension ShoppingItems {
    static let listItemMockData: [ShoppingItems] = [
        ShoppingItems(name: "Milk"),
        ShoppingItems(name: "Bread")
    ]
}
