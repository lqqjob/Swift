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
            CustomTabBarView(tabs: tabs,selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

#Preview {
    let tabs :[TabBarItem] = [
        .home,.favorites,.message,.profile
    ]
    CustomTabBarContainerView(selection: .constant(tabs.first!)) {
        

    }
}
