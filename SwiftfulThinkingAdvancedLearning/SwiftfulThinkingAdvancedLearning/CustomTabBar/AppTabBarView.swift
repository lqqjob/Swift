//
//  AppTabBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 4/24/25.
//

import SwiftUI

struct AppTabBarView: View {
    @State private var selection :TabBarItem = .home
    var body: some View {
        CustomTabBarContainerView(selection: $selection) {
            Color.red.tabBarItem(tab:.home , selection: $selection)
            Color.blue.tabBarItem(tab: .favorites, selection: $selection)
            Color.cyan.tabBarItem(tab: .message, selection: $selection)
            Color.yellow.tabBarItem(tab: .profile, selection: $selection)
        }
    }
}

#Preview {
    let tabs :[TabBarItem] = [
        .home,.favorites,.message,.profile
    ]
    AppTabBarView()
}
