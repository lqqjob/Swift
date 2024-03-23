//
//  ScrollingGrid.swift
//  Moonshot
//
//  Created by liqiang on 2024/3/23.
//

import SwiftUI

struct ScrollingGrid: View {
    let layout = [
        GridItem(.adaptive(minimum: 80)),

    ]
    var body: some View {
        ScrollView {
            LazyVGrid(columns:layout) {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    ScrollingGrid()
}
