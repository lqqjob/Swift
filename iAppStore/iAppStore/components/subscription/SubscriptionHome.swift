//
//  SubscriptionHome.swift
//  iAppStore
//
//  Created by liqiang on 20/01/2025.
//

import SwiftUI

struct SubscriptionHome: View {
    @State private var isAddPresend:Bool = false
    @StateObject private var subscripeVM = AppSubscripeModel()
    var body: some View {
        NavigationView {
            VStack {
                if subscripeVM.subscripes.isEmpty {
                    Spacer()
                    emptyImage
                } else {
                    subscripeListView
                }
                Spacer()
            }
            .navigationTitle("订阅 App 状态")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(trailing: addButton)
            .sheet(isPresented: $isAddPresend) {
                SubscriptionAddView(isAddPresented: $isAddPresend, subscripeVM: subscripeVM)
            }
        }
    }
    
    private var addButton:some View {
        Button {
            isAddPresend = true
        } label: {
            HStack {
                Image(systemName: "plus.circle").imageScale(.large)
            }.frame(height:40)
        }

    }
    private var emptyImage: some View {
        Image(systemName: "tray")
            .font(Font.system(size: 60))
            .foregroundColor(Color.tsmg_tertiaryLabel)
    }
    private var subscripeListView:some View {
        List {
            ForEach(subscripeVM.subscripes,id: \.startTimeStamp) {item in
                NavigationLink(destination: AppDetailView(appId: String(item.appId), regionName: item.regionName)) {
                    SubscripteCellView(item: item)
                }
            }
        }
    }
}

struct SubscripteCellView:View {
    var item:AppSubscripe
    var body: some View {
        HStack {
            ImageLoaderView(url:item.artworkURL100) {
                Image("icon_placeholder")
                    .resizable()
                    .renderingMode(.original)
                    .cornerRadius(17)
                    .frame(width: 75,height: 75)
            } image: { $0.resizable()
                    .renderingMode(.original)
                    .cornerRadius(17)
                    .frame(width: 75,height: 75)
            }
        }
        VStack(alignment: .leading, content: {
            HStack(alignment: .top, content: {
                VStack(alignment: .leading) {
                    Text(item.trackName).foregroundStyle(Color.tsmg_secondaryLabel)
                        .font(.headline)
                        .lineLimit(2)
                        .truncationMode(.tail)
                    Group {
                        switch item.subscripeType {
                        case 0:
                            Text(item.isFinished ? "新版本已生效" : "订阅类型：版本更新")
                        case 1:
                            Text(item.isFinished ? "应用已上架" : "订阅类型：应用上架")
                        case 2:
                            Text(item.isFinished ? "应用已下架" : "订阅类型：应用下架")
                        default:
                            Text("")
                        }
                    }
                    .font(.subheadline)
                    .foregroundStyle(.pink)
                    .padding([.top,.bottom],2)
                    
                    Group {
                        Text("App ID：\(item.appId)")
                        Text("地区：\(item.regionName)")
                    }
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                    .padding(.bottom,1)
                    
                    if item.subscripeType != 1 {
                        Text("当前版本：v\(item.currentVersion)").font(.footnote).padding(.bottom,5)
                    }
                    if item.isFinished {
                        Text("结束时间：\(item.finishTime)")
                            .lineLimit(2)
                            .font(.footnote)
                            .foregroundStyle(.green)
                            .padding(.bottom,8)
                    }else {
                        Text("状态未生效，最后检查时间：\(item.finishTime)")
                            .lineLimit(2)
                            .font(.footnote)
                            .foregroundStyle(.blue)
                            .padding(.bottom,5)
                    }
                }
            })
        })
        .padding(.leading,10)
    }
}

#Preview {
    SubscriptionHome()
}
