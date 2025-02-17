//
//  PickerSection.swift
//  Yummo
//
//  Created by Seymen Özdeş on 17.02.2025.
//

import SwiftUI

struct PickerSection: View {
    var title: String
    var selection: Binding<Int16>
    var times: [Int16]?
    
    var body: some View {
        Section {
            Picker(title, selection: selection) {
                if let times = times {
                    ForEach(times, id: \.self) { times in
                        Text("\(times)")
                            .tag(Int16(times))
                    }
                } else {
                    ForEach(1..<11, id: \.self) { i in
                        Text("\(i)")
                            .tag(Int16(i))
                    }
                }
            }
        } header: {
            Text("Serving")
                .titleModifier()
        }
    }
}
