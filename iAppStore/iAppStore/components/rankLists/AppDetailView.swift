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
        
        }
    }
    
    private func handleFavoriteButton(){
            
    }
}

#Preview {
    NavigationView {
        AppDetailView(appId: "1669437212", regionName: "中国")
    }
}
