//
//  CustomTabBarContainerView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 4/24/25.
//

import SwiftUI

struct CustomTabBarContainerView<Content:View>: View {
    @Binding var selection:TabBarItem //= var selection: TabBarItem     // 访问绑定值                                       var _selection: Binding<TabBarItem>  // 绑定本身
    @State private var tabs: [TabBarItem] = []

    let content:Content
    init(selection:Binding<TabBarItem>,@ViewBuilder content:()->Content) {
        self._selection = selection
        self.content = content()
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            content
                .frame(maxWidth: .infinity ,maxHeight: .infinity)
                .ignoresSafeArea()
            CustomTabBarView(tabs: tabs,selection: $selection)
        }
    }
}

#Preview {
    let tabs :[TabBarItem] = [
        TabBarItem(iconName: "house", title: "Home", color: Color.red),
        TabBarItem(iconName: "heart", title: "Favorites", color: Color.blue),
        TabBarItem(iconName: "person", title: "Profile", color: Color.green)
    ]
    CustomTabBarContainerView(selection: .constant(tabs.first!)) {
        Color.red
    }
}
