//
//  ShoppingListView.swift
//  Yummo
//
//  Created by Seymen Özdeş on 25.08.2024.
//

import SwiftUI

struct ShoppingListView: View {
    @StateObject var listViewModel = ListViewModel()
    @State private var isOn = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack() {
                Text("Alışveriş Listem")
                    .font(.title)
                .bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer()
            
            List {
                ForEach(listViewModel.shoppingItems, id: \.self) { item in
                    FoodListRowView(isOn: $isOn, listItem: item)
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}

#Preview {
    ShoppingListView()
}
