//
//  QRCodeView.swift
//  iAppStore
//
//  Created by Mlqq on 2025/2/13.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct QRCodeView: View {
    let title:String
    let subTitle:String
    let qrCodeContent:String
    @Binding var isShowingQRCode:Bool
    @State var showShareSheet = false
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    
                } label: {
                    Image(systemName: "square.and.arrow.up").imageScale(.large)
                }
                .frame(width: 60,height: 60,alignment: .center)
                .padding([.top,.leading],8)
                .sheet(isPresented: $showShareSheet) {
                    ShareSheet(items: [generateQRCode(from: qrCodeContent)])
                }
                Spacer()
                Text(title).font(.title3).multilineTextAlignment(.center).padding()
                Spacer()
                Button {
                    isShowingQRCode.toggle()
                } label: {
                    Image(systemName: "xmark.circle").imageScale(.large)
                }
                .frame(width: 60,height: 60,alignment: .center)
                .padding([.top,.trailing],8)
            }
            Spacer()
            Image(uiImage: generateQRCode(from: qrCodeContent))
                .resizable()
                .scaledToFit()
                .padding([.leading,.trailing],50)
                .frame(maxWidth: 500)
            Text(subTitle)
                .multilineTextAlignment(.center)
                .foregroundColor(.accentColor)
            Spacer()
        }
    }
    
    private func generateQRCode(from string:String) -> UIImage {
        let data = string.data(using:.utf8)
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            filter.setValue("H", forKey: "inputCorrectionLevel")
            
            if let outputImage = filter.outputImage {
                let context = CIContext()
                let scale = UIScreen.main.scale
                // 将输出图像的尺寸放大一定倍数，例如放大为原来的10倍
                let transformedImage = outputImage.transformed(by: CGAffineTransform(scaleX: 10, y: 10))
                if let cgImage = context.createCGImage(transformedImage, from: transformedImage.extent) {
                    return UIImage(cgImage: cgImage, scale: scale, orientation: .up)
                }
            }
        }
        return UIImage(systemName:"qrcode") ?? UIImage()
    }
}

#Preview {
    QRCodeView(title: "扫一扫下载", subTitle: "‎App Store 上的“凡人修仙传：人界篇-正版授权”", qrCodeContent: "https://apps.apple.com/cn/app/69437212", isShowingQRCode: .constant(false))
}
