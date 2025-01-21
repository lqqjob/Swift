//
//  SettingHome.swift
//  iAppStore
//
//  Created by liqiang on 20/01/2025.
//

import SwiftUI

struct LinkString:Identifiable {
    let url:String
    var id:String {url}
}

struct SettingHome: View {
    @State private var linkagePage:LinkString? = nil
    private let items = ["切换图标","AppStore","禅应用","点点数据","七麦数据"]
    var body: some View {
        NavigationView {
            Group {
                List {
                    Section(header:Text("功能")) {
                        ForEach(items,id: \.self) { title in
                            SettingItemCell(linkPage: $linkagePage, title: title, index: items.firstIndex(of: title)!)
                        }
                    }
                    Section(header:Text("服务")) {
                        NavigationLink(destination: AppFavoritesView()) {
                            HStack {
                                Text("App 收藏夹")
                                Spacer()
                            }
                            .padding([.top,.bottom],10)
                        }
                        NavigationLink(destination: AppleServicesView()) {
                            HStack {
                                Text("苹果常用网站")
                                Spacer()
                            }
                            .padding([.top,.bottom],10)
                        }
                        
                        AppleSubscriptionManagerView(linkPage: $linkagePage)
                    }
                    Section(header: Text("关于")) {
                        NavigationLink(destination: AboutAppView()) {
                            Text("关于应用").frame(height:50)
                        }
                        SettingItemCell(linkPage: $linkagePage, title: "GitHub 开源", index: items.count)
                        SettingItemCell(linkPage: $linkagePage, title: "37手游移动客户端团队", index: items.count + 1)
                    }
                }
            }
            .navigationTitle("设置")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .sheet(item: $linkagePage) { linkage in
            SafariView(url: URL(string:linkage.url)!)
        }
    }
}

struct AppleSubscriptionManagerView:View {
    @Binding var linkPage:LinkString?
    private let subscriptionsURL = "https://apps.apple.com/account/subscriptions"
    var body: some View {
        HStack{
            Button {
                linkPage = LinkString(url: subscriptionsURL)
            } label: {
                Text("苹果订阅管理").foregroundColor(Color.primary)
            }
            Spacer()
            Image(systemName: "chevron.right").imageScale(.small).foregroundColor(Color.tsmg_placeholderText)
        }
        .padding([.top,.bottom],10)
    }
}

struct SettingItemCell:View {
    @Binding var linkPage:LinkString?
    var title:String
    var index:Int
    @State private var iconViewIsExpanded:Bool = false
    @State private var icons:[String] = ["iAppStore", "AppStore", "AppStoreNew", "AppStoreWhite", "37", "37iOS", "37AppStore", "Apple", "AppleRainbow"]
    
    var body: some View {
        if index == 0 {
            DisclosureGroup(title,isExpanded: $iconViewIsExpanded) {
                ForEach(0..<icons.count,id: \.self) {index in
                    let type = icons[index]
                    VStack {
                        HStack {
                            Image(type+"_icon")
                                .resizable()
                                .frame(width: 65, height: 65)
                                .cornerRadius(15)
                                .padding(.leading,5)
                            Text((index == 0 ? "默认" : type) + "图标").padding(.leading,15)
                            Spacer()
                            Image(systemName: "chevron.right").imageScale(.small).foregroundColor(Color.tsmg_placeholderText).padding(.trailing,10)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        UIApplication.shared.setAlternateIconName(index == 0 ? nil : type)
                        withAnimation {
                            iconViewIsExpanded = false;
                        }
                    }
                    
                }
            }
            .padding([.top,.bottom],10)
            .accentColor(Color.tsmg_placeholderText)
        }else {
            HStack{
                Button(action:{
                    switch index {
                    case 0:
                        break
                    case 1:
                        let url = URL(string: "itms-apps://itunes.apple.com")
                        UIApplication.shared.open(url!)
                    case 2:
                        linkPage = LinkString(url: "https://app.chandashi.com")
                    case 3:
                        linkPage = LinkString(url: "https://app.diandian.com")
                    case 4:
                        linkPage = LinkString(url: "https://www.qimai.cn")
                    case 5:
                        linkPage = LinkString(url: "https://github.com/37MobileTeam/iAppStore-SwiftUI")
                    case 6:
                        linkPage = LinkString(url: "https://juejin.cn/user/1002387318511214")
                    default:
                        break
                    }
                }) {
                    Text(title).foregroundColor(Color.tsmg_label)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right").imageScale(.small).foregroundColor(Color.tsmg_placeholderText)
            }
            .padding([.top,.bottom],10)
        }
    }
}

#Preview {
    SettingHome()
}
