//
//  AppDetailContentView.swift
//  iAppStore
//
//  Created by liqiang on 2/26/25.
//

import SwiftUI

enum AppDetailAlertType:Identifiable {
    case copyBundleId
    
    var id:Int {hashValue}
}

struct AppDetailContentView: View {
    @ObservedObject var appModel = AppDetailModel()
    @State private var alertType: AppDetailAlertType?

    var body: some View {
        if appModel.app == nil {
            Rectangle().overlay(Color.tsmg_tertiarySystemGroupedBackground)
                .cornerRadius(20)
                .padding(.all)
                .animation(.easeInOut, value: 9)
                .transition(.opacity)
        }else {
            ScrollView{
                AppdetailHeaderView(appModel: appModel, alertType: $alertType)
                    .contextMenu{
                        AppContextMenu(appleID: String(appModel.app?.trackId ?? 0), bundleID: appModel.app?.bundleId, appUrl: appModel.app?.trackViewUrl, developerUrl: appModel.app?.artistViewUrl, showAppDataSize: false)

                    }
            }
        }
    }
    
}

struct AppdetailHeaderView:View {
    @ObservedObject var appModel:AppDetailModel
    @Binding var alertType:AppDetailAlertType?
    var body: some View {
        ZStack{
            ImageLoaderView(url:appModel.app?.artworkUrl100) {
                Spacer()
            } image: {
                $0.resizable()
                    .blur(radius: 50, opaque: true)
                    .overlay(Color.black.opacity(0.25))
                    .animation(.easeInOut)
                    .transition(.opacity)
            }

        }
    }
}

#Preview {
    AppDetailContentView()
}
