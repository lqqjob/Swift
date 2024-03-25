//
//  HandlingNavigationNavigationDestination.swift
//  Navigation
//
//  Created by liqiang on 2024/3/25.
//

import SwiftUI

struct HandlingNavigationNavigationDestination: View {
    var body: some View {
        NavigationStack {
            List(0..<1000) { i in
                NavigationLink("Select \(i)",value: i)
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    HandlingNavigationNavigationDestination()
}
