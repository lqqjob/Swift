//
//  TabBarItemsPreferenceKey.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 4/27/25.
//

import SwiftUI

struct TabBarItemsPreferenceKey:PreferenceKey {
    static var defaultValue: [TabBarItem] = [];
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value+=nextValue()
    }
}


struct TabBarItemViewModifier:ViewModifier {
    let tab:TabBarItem
    @Binding var selection:TabBarItem
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0)
            .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
    }
}
struct TabBarItemViewModiferWithOnAppear: ViewModifier {
    
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    
    @ViewBuilder func body(content: Content) -> some View {
        if selection == tab {
            content
                .opacity(1)
                .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
        } else {
            Text("")
                .opacity(0)
                .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
        }
    }
    
}
extension View {
    func tabBarItem(tab:TabBarItem,selection:Binding<TabBarItem>) -> some View {
//        modifier(TabBarItemViewModifier(tab: tab, selection: selection))
        modifier(TabBarItemViewModiferWithOnAppear(tab: tab, selection: selection))

    }
}
