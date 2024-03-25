//
//  NavigationWithNavigationStack.swift
//  Navigation
//
//  Created by liqiang on 2024/3/25.
//

import SwiftUI

struct NavigationWithNavigationStack: View {
    @State private var path = [Int]()

    var body: some View {
        NavigationStack(path:$path) {
            VStack {
                Button("Show 32") {
                    path = [32]
                }
                Button("Show 64") {
                    path.append(64)
                }
                Button("Show 32 then 64") {
                    path = [32,64]
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected \(selection)")
            }
        }
    }
}

#Preview {
    NavigationWithNavigationStack()
}
