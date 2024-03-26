//
//  CustomizingTheNavigation.swift
//  Navigation
//
//  Created by liqiang on 2024/3/26.
//

import SwiftUI

struct CustomizingTheNavigation: View {
    var body: some View {
        NavigationStack {
            List(0..<100) { i in
                Text("Row \(i)")
            }
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue,for: .navigationBar)
            .toolbarColorScheme(.dark)
            .toolbar(.hidden, for: .navigationBar)
            
        }
    }
}

#Preview {
    CustomizingTheNavigation()
}
