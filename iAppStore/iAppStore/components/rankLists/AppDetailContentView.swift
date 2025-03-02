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
                    .animation(.easeInOut,value: 1)
                    .transition(.opacity)
            }
            if appModel.app == nil {
                Rectangle().foregroundStyle(.white).padding(.all).animation(.easeInOut, value: 0).transition(.opacity)
            }
            
            HStack(alignment:.top) {
                VStack(alignment:.center) {
                    ImageLoaderView(url:appModel.app?.artworkUrl512,placeholder:{
                        Image("icon_placeholder")
                            .resizable()
                            .renderingMode(.original)
                            .cornerRadius(20)
                            .frame(width: 100,height:100)
                    }) {
                        $0.resizable()
                            .renderingMode(.original)
                            .cornerRadius(20)
                            .frame(width: 100,height: 100)
                    }
                    Spacer().frame(height: 15)
                    Text("v\(appModel.app?.version ?? "")")
                        .foregroundStyle(Color.tsmg_systemBackground)
                    Spacer()
                    Text(appModel.app?.averageRating ?? "")
                        .foregroundStyle(Color.tsmg_systemBackground)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("满分 5 分").font(.footnote).foregroundStyle(Color.tsmg_systemBackground.opacity(0.5)).fontWeight(.heavy)
                    Spacer()
                }
                Spacer().frame(width: 20)
                VStack(alignment:.leading) {
                    AppDetailTextView(key: "价格", value: appModel.app?.formattedPrice ?? "")
                    AppDetailTextView(key: "分级", value: appModel.app?.contentAdvisoryRating ?? "")
                    AppDetailTextView(key: "分类", value: (appModel.app?.genres ?? []).joined(separator: ","))
                    AppDetailTextView(key: "App ID", value: String(appModel.app?.trackId ?? 0))
                    HStack {
                        Text("包名").font(.subheadline)
                        if #available(iOS 15.0, *) {
                            Button(appModel.app?.bundleId ?? "") {
                                alertType = .copyBundleId
                            }.buttonStyle(.bordered)
                        }else {
                            Button(appModel.app?.bundleId ?? "") {
                                alertType = .copyBundleId
                            }
                        }
                    }
                    AppDetailTextView(key: "开发者", value: appModel.app?.artistName ?? "")
                    AppDetailTextView(key: "上架时间", value: appModel.app?.releaseTime ?? "")
                }.foregroundStyle(Color.tsmg_systemBackground)
                Spacer()
            }.padding([.leading,.trailing],12).padding([.top,.bottom],18)

        }.frame(alignment: .top)
    }
}

struct AppDetailTextView:View {
    var key:String
    var value:String
    var body: some View {
        HStack {
            Text(key).font(.subheadline)
            Text(value).font(.subheadline).fontWeight(.bold)
        }.padding(1)
    }
}
#Preview {
    AppDetailContentView()
}
