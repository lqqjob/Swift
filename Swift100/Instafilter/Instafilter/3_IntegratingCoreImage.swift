//
//  IntegratingCoreImage.swift
//  Instafilter
//
//  Created by liqiang on 2024/4/10.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct IntegratingCoreImage: View {
    @State private var image:Image?
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform:loadImage)
    }
    func loadImage() {
        let inputImage = UIImage(resource: ImageResource(name: "bmy", bundle: Bundle.main))
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        
//        let currentFilter = CIFilter.sepiaTone()
//        currentFilter.inputImage = beginImage
//        currentFilter.intensity = 1
        
//        let currentFilter = CIFilter.crystallize()
//        currentFilter.inputImage = beginImage
//        currentFilter.radius = 200
        
//        let currentFilter = CIFilter.pixellate()
//        currentFilter.inputImage = beginImage
//        currentFilter.scale = 100
        
//        let currentFilter = CIFilter.twirlDistortion()
//        currentFilter.inputImage = beginImage
//        currentFilter.radius = 500
//        currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)
        
        let currentFilter = CIFilter.twirlDistortion()
        currentFilter.inputImage = beginImage
      
        let amount = 1.0
        let inputKeys = currentFilter.inputKeys
        
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(amount, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) { 
            currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) { 
            currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)
        }
        
        guard let outPutImage = currentFilter.outputImage else {return}
        guard let cgImage = context.createCGImage(outPutImage, from: outPutImage.extent) else {return}
        let uiImage = UIImage(cgImage: cgImage)
        image = Image(uiImage:uiImage)
    }
}

#Preview {
    IntegratingCoreImage()
}
