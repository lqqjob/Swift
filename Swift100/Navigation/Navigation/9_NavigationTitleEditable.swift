//
//  NavigationTitleEditable.swift
//  Navigation
//
//  Created by liqiang on 2024/3/26.
//

import SwiftUI

struct NavigationTitleEditable: View {
    @State private var title = "SwiftUIs"
    
    var body: some View {
        NavigationStack {
            Text("Hello, World!")
                .navigationTitle($title)
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    NavigationTitleEditable()
}
