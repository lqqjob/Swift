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
    @StateObject private var appRankModel = AppRankModel()
    var body: some View {
        NavigationView {
            ZStack {
                if appRankModel.isLoading {
                    emptyView
                }else {
                    if appRankModel.results.isEmpty {
                        
                    }else {
                        VStack {
                            
                        }
                        .padding(.top,75)
                    }
                }
            }
        }
        .onAppear {
            if appRankModel.results.isEmpty {
//                appRankModel.r
            }
        }
    }
}
extension RankHome {
    var emptyView :some View {
        VStack {
            Spacer()
            Image(systemName: "tray.and.arrow.dowm")
                .font(Font.system(size: 60))
                .foregroundStyle(Color.tsmg_tertiaryLabel)
            Spacer()
        }
    }
    
    var listView:some View {
        List {
            ForEach(appRankModel.results, id: \.imName.label) { item in
                let index = appRankModel.results.firstIndex {
                    $0.imName.label == item.imName.label
                }
                NavigationLink {
                    AppDetailView(appId: item.id.attributes.imID, regionName: regionName, item: item)
                } label: {
                    Text(item.title.label)
                }

            }
        }
    }
}
#Preview {
    RankHome()
}
