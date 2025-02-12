//
//  SwiftUIView.swift
//  iAppStore
//
//  Created by liqiang on 23/01/2025.
//

import SwiftUI

struct AppDetailView: View {
    var appId:String
    var regionName:String
    var item:AppRank?
    @StateObject private var appModel = AppDetailModel()
    @State private var isShowingQRCode = false
    @State private var isAppFavorites = false
    var body: some View {
        Group {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
//        .navigationBarTitle(item?.imName.label ?? appModel.app?.trackName ?? "",displayMode: .large)
    }
}

#Preview {
    NavigationView {
        AppDetailView(appId: "1669437212", regionName: "中国")
    }
}
