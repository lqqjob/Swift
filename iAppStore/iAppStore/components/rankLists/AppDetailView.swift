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
            AppDetailContentView(appModel: appModel)
        }
        .navigationBarTitle(item?.imName.label ?? appModel.app?.trackName ?? "",displayMode: .large)
        .navigationBarBackButtonHidden(false)
        .navigationBarItems(trailing: HStack(spacing: 5, content: {
            Button(action: handleFavoriteButton) {
                if isAppFavorites {
                    Image(systemName: "star.fill")
                        .foregroundStyle(.yellow)
                }else {
                    Image(systemName: "star")
                }
            }
            
            Button {
                isShowingQRCode = true
            } label: {
                Image(systemName: "qrcode")
            }
            
            Link(destination: URL(string: appModel.app?.trackViewUrl ?? item?.id.label ?? "https://apple.com")!) {
                Image(systemName: "icloud.and.arrow.down").font(.subheadline)
            }

        }))
        .sheet(isPresented: $isShowingQRCode) {
            QRCodeView(title: "扫一扫下载", subTitle: "App Store 上的“\(item?.imName.label ?? appModel.app?.trackName ?? "")”", qrCodeContent: item?.id.label ?? appModel.app?.trackViewUrl ?? "error", isShowingQRCode: $isShowingQRCode)
        }
        .onAppear {
            isAppFavorites = AppFavoritesModel.shared.search(appId) != nil
            if appModel.app == nil {
                appModel.searchAppData(appId, nil, regionName)
            }
        }
    }
    
    private func handleFavoriteButton(){
        if isAppFavorites {
            AppFavoritesModel.shared.remove(appId:appId)
        }else {
            AppFavoritesModel.shared.add(AppFavorite(appId: appId, regionName: regionName))
        }
    
        withAnimation {
            isAppFavorites.toggle()
        }
    }
}

#Preview {
    NavigationView {
        AppDetailView(appId: "1669437212", regionName: "中国")
    }
}
