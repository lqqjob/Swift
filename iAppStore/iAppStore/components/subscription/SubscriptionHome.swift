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
                if subscripeVM.subscripe.isEmpty {
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
            ForEach(subscripeVM.subscripe,id: \.startTimeStamp) {item in
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
        Text("")
    }
}

#Preview {
    SubscriptionHome()
}
