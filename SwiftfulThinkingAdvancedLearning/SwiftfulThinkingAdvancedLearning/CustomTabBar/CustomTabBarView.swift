//
//  CustomTabBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 4/21/25.
//

import SwiftUI

struct CustomTabBarView: View {
    let tabs:[TabBarItem]
    @State private var selection:TabBarItem = TabBarItem(iconName: "house", title: "Home", color: Color.red)
    var body: some View {
        HStack {
            ForEach(tabs,id: \.self) { item in
                tabView(item: item)
                    .onTapGesture {
                        switchToTab(tab: item)
                    }
                
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
}
extension CustomTabBarView {
    private  func tabView(item:TabBarItem) -> some View {
        VStack {
            Image(systemName: item.iconName)
                .font(.subheadline)
            Text(item.title)
                .font(.system(size: 10,weight: .semibold,design: .rounded))
        }
        .foregroundStyle(selection == item ? item.color : Color.gray)
        .padding(.vertical,8)
        .frame(maxWidth: .infinity)
        .background(selection == item ? item.color.opacity(0.2): Color.clear)
        .cornerRadius(10)
    }
    func switchToTab(tab:TabBarItem) {
        withAnimation(.easeInOut) {
            selection = tab
        }
    }
}
struct TabBarItem:Hashable {
    let iconName:String
    let title:String
    let color:Color
}
#Preview {
    let tabs :[TabBarItem] = [
        TabBarItem(iconName: "house", title: "Home", color: Color.red),
        TabBarItem(iconName: "heart", title: "Favorites", color: Color.blue),
        TabBarItem(iconName: "person", title: "Profile", color: Color.green)
    ]
    CustomTabBarView(tabs: tabs)
}
