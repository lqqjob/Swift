//
//  AppTabBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 4/24/25.
//

import SwiftUI

struct AppTabBarView: View {
    @State private var selection :TabBarItem = TabBarItem(iconName: "house", title: "Home", color: Color.red)
    var body: some View {
        CustomTabBarContainerView(selection: $selection) {
            Color.red
        }
    }
}

#Preview {
    let tabs :[TabBarItem] = [
        TabBarItem(iconName: "house", title: "Home", color: Color.red),
        TabBarItem(iconName: "heart", title: "Favorites", color: Color.blue),
        TabBarItem(iconName: "person", title: "Profile", color: Color.green)
    ]
    AppTabBarView()
}
