//
//  iAppStoreApp.swift
//  iAppStore
//
//  Created by liqiang on 2024/12/31.
//

import SwiftUI

@main
struct iAppStoreApp: App {
    var body: some Scene {
        WindowGroup {
            TabbarView()
        }
    }
}


struct TabbarView:View {
    enum Tab:Int {
        case rankLists,search,subscription,setting
    }
    @State var selectedTap = Tab.rankLists
    func tabbarItem(text:String,image:String)-> some View {
        VStack {
            Image(systemName: image)
            Text(text)
        }
    }
    var body: some View {
        TabView(selection: $selectedTap) {
            RankHome().tabItem {
                self.tabbarItem(text: "榜单", image: "arrow.up.arrow.down.square")
            }.tag(Tab.rankLists)
            SearchHome().tabItem {
                self.tabbarItem(text: "搜素", image: "magnifyingglass.circle.fill")
            }.tag(Tab.search)
            SubscriptionHome().tabItem {
                self.tabbarItem(text: "订阅", image: "checkmark.seal.fill")
            }.tag(Tab.subscription)
            SettingHome().tabItem {
                self.tabbarItem(text: "设置", image: "gearshape")
            }.tag(Tab.setting)
        }
    }
}
