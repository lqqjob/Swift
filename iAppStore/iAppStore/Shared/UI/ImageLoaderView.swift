//
//  ImageLoaderView.swift
//  iAppStore
//
//  Created by liqiang on 2025/2/10.
//

import Foundation
import SwiftUI
import Combine
struct ImageLoaderView<Placeholder:View,ConfiguredImage:View>:View {
    var url:String?
    private let placeholder:()->Placeholder
    private let image:(Image) -> ConfiguredImage
    private let completion:((UIImage)->Void)?
    
    @ObservedObject var imageLoader:ImageLoaderService
    @State var imageData:UIImage?
    
    init(url: String? = nil, placeholder: @escaping () -> Placeholder, image: @escaping (Image) -> ConfiguredImage, completion: ((UIImage) -> Void)? = nil) {
        self.url = url
        self.placeholder = placeholder
        self.image = image
        self.completion = completion
        self.imageLoader = ImageLoaderService(url: URL(string: url ?? "http://apple.com")!)
    
    }
    
    @ViewBuilder private var imageContent:some View {
        if let data = imageData {
            image(Image(uiImage: data))
        } else {
            placeholder()
        }
    }
    
    var body: some View {
        imageContent.onReceive(imageLoader.$image) { imageData in
            self.imageData = imageData
            completion?(imageData)
        }
    }
}

class ImageLoaderService:ObservableObject {
    @Published var image = UIImage()
    private var imageSubscription:AnyCancellable?
    private let fileManager = LocalFileManager.instance
    private let folderName = "iAppStore_images"
    private let url :URL
    
    init(url:URL) {
        self.url = url
        loadImage()
        
    }
    private func loadImage() {
        if let savedImage = fileManager.getImage(imageName: url.path.md5, folderName: folderName) {
            image = savedImage
        }else {
            downloadImage()
        }
    }
    
    private func downloadImage() {
        imageSubscription = NetworkingManager.dowload(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: NetworkingManager.handleCompetion, receiveValue: { [weak self] (returnedImage) in
                guard let self = self,let downloadedImage = returnedImage else {return}
                
                self.image = downloadedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.url.path.md5, folderName: self.folderName)
            })
    }
}
