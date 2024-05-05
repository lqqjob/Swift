//
//  CreatingContextMenus.swift
//  HotProspects
//
//  Created by liqiang on 2024/5/1.
//

import SwiftUI

struct CreatingContextMenus: View {
    @State private var backgroundColor = Color.red
    var body: some View {
        VStack {
            Text("Hello,World!")
                .padding()
                .background(backgroundColor)
            Text("Change Color")
                .padding()
                .contextMenu(ContextMenu(menuItems: {
                    Button("Red",systemImage: "checkmark.circle.fill", role: .destructive) {
                        backgroundColor = .red
                    }
                    Button("Green") {
                        backgroundColor = .green
                    }
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }))
        }
    }
}

#Preview {
    CreatingContextMenus()
}
