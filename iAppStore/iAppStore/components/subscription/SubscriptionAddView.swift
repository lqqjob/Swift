//
//  SubscriptionAddView.swift
//  iAppStore
//
//  Created by liqiang on 23/01/2025.
//

import SwiftUI

struct SubscriptionAddView: View {
    @Binding var isAddPresented:Bool
    @ObservedObject var subscripeVM:AppSubscripeModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SubscriptionAddView(isAddPresented: .constant(true), subscripeVM: AppSubscripeModel())
}
