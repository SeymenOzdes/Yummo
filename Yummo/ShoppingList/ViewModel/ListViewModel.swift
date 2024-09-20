//
//  ListViewModel.swift
//  Yummo
//
//  Created by Seymen Özdeş on 25.08.2024.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published private(set) var shoppingItems: [ShoppingItems] = []
    
    init() {
        shoppingItems =  ShoppingItems.listItemMockData
    }
}
