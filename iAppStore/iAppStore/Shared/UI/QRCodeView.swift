//
//  QRCodeView.swift
//  iAppStore
//
//  Created by Mlqq on 2025/2/13.
//

import SwiftUI

struct QRCodeView: View {
    let title:String
    let subTitle:String
    let qrCodeContent:String
    @Binding var isShowingQRCode:Bool
    @State var showShareSheet = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    QRCodeView(title: "扫一扫下载", subTitle: "‎App Store 上的“凡人修仙传：人界篇-正版授权”", qrCodeContent: "https://apps.apple.com/cn/app/69437212", isShowingQRCode: .constant(false))
}
