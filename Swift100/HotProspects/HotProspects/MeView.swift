//
//  MeView.swift
//  HotProspects
//
//  Created by liqiang on 2024/5/5.
//

import SwiftUI
import CoreImage.CIFilterBuiltins

struct MeView: View {
    @AppStorage("Name") private var name = "Anonymoushello"
    @AppStorage("emailAddress") private var emilAddress = "you@yousite.com"
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    @State private var qrCode = UIImage()
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name",text: $name)
                    .textContentType(.name)
                    .font(.title)
                
                TextField("Email address",text: $emilAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                Image(uiImage: qrCode)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200,height: 200)
                    .contextMenu {
                        ShareLink(item:Image(uiImage: qrCode),preview: SharePreview("My QR Code",image: Image(uiImage: qrCode)))
                    }
            }
            .navigationTitle("Your code")
            .onAppear(perform: updateCode)
            .onChange(of: name,updateCode)
            .onChange(of: emilAddress, updateCode)
        }
    }
    
    func generateQRCode(from string:String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        
        return UIImage(systemName:"xmark.circle") ?? UIImage()
    }
    func updateCode() {
        qrCode = generateQRCode(from: "\(name)\n\(emilAddress)")
    }
}

#Preview {
    MeView()
}
