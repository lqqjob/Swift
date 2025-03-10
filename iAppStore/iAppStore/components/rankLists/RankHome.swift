//
//  RankHome.swift
//  iAppStore
//
//  Created by liqiang on 20/01/2025.
//

import SwiftUI

struct RankHome: View {
    @AppStorage("kRankTypeName") private var rankName:String = "热门免费榜"
    @AppStorage("kRankCategoryName") private var categoryName:String = "所有 App"
    @AppStorage("kRankReginName") private var regionName:String = "中国"
    @State var isShowAlert = false
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RankHome()
}
