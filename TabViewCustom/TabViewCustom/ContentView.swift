//
//  ContentView.swift
//  TabViewCustom
//
//  Created by liqiang on 4/14/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("首页",systemImage: "house")
                }
            
            SettingView().tabItem {
                Label("设置",systemImage: "gear")
            }
        }
    }
}

#Preview {
    ContentView()
}
