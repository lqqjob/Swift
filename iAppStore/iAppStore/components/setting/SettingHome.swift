//
//  SettingHome.swift
//  iAppStore
//
//  Created by liqiang on 20/01/2025.
//

import SwiftUI

struct LinkString {
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
                }
            }
            .navigationTitle("设置")
            .navigationBarTitleDisplayMode(.automatic)
        }
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
                        UIApplication.shared.setAlternateIconName(index == 0 ? nil : type) {error in
                            if let error = error {
                                
                            }else {
                                
                            }
                            
                        }
                        
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
                
            }
        }
    }
}

#Preview {
    SettingHome()
}
