//
//  ContentView.swift
//  Instafilter
//
//  Created by liqiang on 2024/4/8.
//

import SwiftUI
import PhotosUI
import CoreImage
import CoreImage.CIFilterBuiltins
struct ContentView: View {
    @State private var processedImage:Image?
    @State private var filterIntensity = 0.5
    @State private var selectdItem:PhotosPickerItem?
    @State private var currentFilter = CIFilter.sepiaTone()
    let context = CIContext()
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                PhotosPicker(selection:$selectdItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    }else {
                        ContentUnavailableView("No Picture", systemImage: "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectdItem, loadImage)
                Spacer()
                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .onChange(of: filterIntensity,applyProcessing)
                }
                .padding(.vertical)
                HStack {
                    Button("Change Filter",action: changeFilter)
                    Spacer()
                }
            }
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
        }
    }
    
    func changeFilter() {
        
    }
    func loadImage() {
        Task {
            guard let imageData = try await selectdItem?.loadTransferable(type: Data.self) else {return}
            guard let inputImage = UIImage(data: imageData) else {return}
            
            let beginImage = CIImage(image: inputImage)
            currentFilter.inputImage = beginImage
            applyProcessing()
        }
    }
    
    func applyProcessing() {
        currentFilter.intensity = Float(filterIntensity)
        guard let outputImage = currentFilter.outputImage else {return}
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else {return}
        
        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
                
    }
}

#Preview {
    ContentView()
}
