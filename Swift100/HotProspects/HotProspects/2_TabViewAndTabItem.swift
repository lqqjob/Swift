//
//  TabViewAndTabItem.swift
//  HotProspects
//
//  Created by liqiang on 2024/5/1.
//

import SwiftUI

struct TabViewAndTabItem: View {
    @State private var selectedTab = "One"
    var body: some View {
        TabView(selection:$selectedTab) {
            NavigationStack{
                Button("Show Tab 2") {
                    selectedTab = "Two"
                }
                .navigationTitle("One")
                .navigationBarTitleDisplayMode(.inline)

            }
                .tabItem {
                    Label("One",systemImage: "star")
                }
                .tag("One")
            NavigationStack{
                Text("Tab 2")
                    .navigationTitle("Two")
                    .navigationBarTitleDisplayMode(.inline)
            }
                .tabItem {
                    Label("Two",systemImage: "circle")
                }
                .tag("Two")
        }
        
    }
}

#Preview {
    TabViewAndTabItem()
}
