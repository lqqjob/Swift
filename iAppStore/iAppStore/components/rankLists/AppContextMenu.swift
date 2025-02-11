//
//  AppContextMenu.swift
//  iAppStore
//
//  Created by liqiang on 2025/2/11.
//

import SwiftUI

struct AppContextMenu: View {
    let appleID:String?
    let bundleID:String?
    let appUrl:String?
    let developerUrl:String?
    var showAppDataSize : Bool = false
    
    @AppStorage("kIsShowAppDataSize") private var isShowAppDataSize = false
    var body: some View {
        VStack {
            if appleID != nil {
                createMenuItem(text: "复制 App ID", imgName: "doc.on.doc") {
                    appleID!.copyToClipboard()
                }
            }
            
            if bundleID != nil {
                createMenuItem(text: "复制 App 包名", imgName: "doc.on.doc.fill") {
                    bundleID?.copyToClipboard()
                }
            }
            
            if appUrl != nil {
                createMenuItem(text: "复制 App 商店链接", imgName: "link") {
                    appUrl!.copyToClipboard()
                }
                createMenuItem(text: "从 App Store 打开 App", imgName: "paperplane") {
                    guard let url = URL(string: appUrl!) else {
                        return
                    }
                    UIApplication.shared.open(url)
                }
            }
            
            if developerUrl != nil {
                createMenuItem(text: "复制开发者商店链接", imgName: "person") {
                    developerUrl!.copyToClipboard()
                }
                
                createMenuItem(text: "打开开发者商店主页", imgName: "person.fill") {
                    if let url = URL(string: developerUrl!) {
                        UIApplication.shared.open(url)
                    }
                }
            }
            
            if showAppDataSize {
                createMenuItem(text: "\(isShowAppDataSize ? "隐藏" : "显示") App 大小和最低支持系统", imgName: "arrow.down.app") {
                    isShowAppDataSize.toggle()
                }
            }
        }
    }
    
    func createMenuItem(text:String,imgName:String,action:(()->Void)?) -> some View {
        Button {
            action?()
        } label: {
            HStack {
                Text(text)
                Image(systemName: imgName)
                    .imageScale(.small)
                    .foregroundStyle(.primary)
            }
        }

    }
}

#Preview {
    AppContextMenu(appleID: "123456", bundleID: "iAppStore", appUrl: "https://juejin.cn/user/1002387318511214", developerUrl: "https://juejin.cn/user/1002387318511214", showAppDataSize: true)
}
