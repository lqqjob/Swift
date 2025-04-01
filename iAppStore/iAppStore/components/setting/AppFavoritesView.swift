//
//  AppFavoritesView.swift
//  iAppStore
//
//  Created by liqiang on 21/01/2025.
//

import SwiftUI

struct AppFavoritesView: View {
    @StateObject private var appModel:AppDetailModel = AppDetailModel()
    var body: some View {
        VStack {
            if appModel.results.isEmpty {
                EmptyStateView()
            }else {
                List {
                    ForEach(appModel.results,id: \.trackId) { item in
                        let index = appModel.results.firstIndex { $0.trackId == item.trackId }
                        let app = AppFavoritesModel.shared.search("\(item.trackId)")
                        NavigationLink(destination: AppDetailView(appId: String(item.trackId), regionName: app?.regionName ?? "中国")) {
                            SearchCellView(index: index ?? 0, item: item).frame(height: 110)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("App 收藏夹")
        .navigationBarTitleDisplayMode(.automatic)
        .onAppear() {
            let favorites = AppFavoritesModel.shared.appFavorites()
            if(favorites.isEmpty) {
                appModel.results.removeAll()
            }else {
//                favorites.forEach { favoriteApp in
//                    let app = appModel.results.firstIndex(where: { app in
//                        return "\(app.trackId)" == favoriteApp.appId
//                    })
//                    if (app == nil) {
//                        appModel.lookupAppId(favoriteApp.appId, favoriteApp.regionName)
//                    }
//                }
//                var removeAppDetail:[AppDetail] = []
//                appModel.results.forEach { appDetail in
//                    let index = favorites.firstIndex { favoriteApp in
//                        return "\(appDetail.trackId)" == favoriteApp.appId
//                    }
//                    if index == nil {
//                        removeAppDetail.append(appDetail)
//                    }
//                }
//                
//                appModel.results.removeAll { app in
//                    removeAppDetail.contains { $0.trackId == app.trackId
//                    }
//                }
                
                let favoriteAppIds = Set(favorites.map { $0.appId })  // 使用 Set 提高查找效率

                var removeAppDetail: [AppDetail] = []

                appModel.results.forEach { appDetail in
                    if !favoriteAppIds.contains("\(appDetail.trackId)") {
                        removeAppDetail.append(appDetail)
                    }
                }

                // 直接移除不在收藏夹里的 App
                appModel.results.removeAll { app in removeAppDetail.contains { app.trackId == $0.trackId } }

                // 遍历收藏夹，如果 `appModel.results` 里没有该 App，就去查找详情
                favorites.forEach { favoriteApp in
                    if !appModel.results.contains(where: { "\( $0.trackId )" == favoriteApp.appId }) {
                        appModel.lookupAppId(favoriteApp.appId, favoriteApp.regionName)
                    }
                }
            }
           
        }
    }
}

struct EmptyStateView:View {
    var body: some View {
        Spacer()
        Image(systemName: "list.star")
            .font(Font.system(size: 60))
            .foregroundStyle(Color.tsmg_tertiaryLabel)
        Spacer()
    }
}

#Preview {
    AppFavoritesView()
}
