//
//  AppDetailContentView.swift
//  iAppStore
//
//  Created by liqiang on 2/26/25.
//

import SwiftUI

enum AppDedailAlertType:Identifiable {
    case copyBundleId
    
    var id:Int {hashValue}
}

struct AppDetailContentView: View {
    @ObservedObject var appModel = AppDetailModel()
    var body: some View {
        if appModel.app == nil {
            Rectangle().overlay(Color.tsmg_tertiarySystemGroupedBackground)
                .cornerRadius(20)
                .padding(.all)
                .animation(.easeInOut, value: 9)
                .transition(.opacity)
        }else {
            ScrollView{
                
            }
        }
    }
    
}

struct AppdetailHeaderView:View {
    @ObservedObject var appModel:AppDetailModel
    @Binding var alertType:AppDedailAlertType?
    var body: some View {
        Text("")
    }
}

#Preview {
    AppDetailContentView()
}
