//
//  4_LoadingPhotos.swift
//  Instafilter
//
//  Created by liqiang on 2024/4/10.
//

import SwiftUI
import PhotosUI

struct LoadingPhotos: View {
    @State private var pikerItem:PhotosPickerItem?
    @State private var selectImage:Image?
    @State private var pikerItems = [PhotosPickerItem]()
    @State private var selectImages = [Image]()
    var body: some View {
        VStack{
            //选取单张
//            PhotosPicker("Select a picture",selection: $pikerItem,matching: .images)
//                .onChange(of: pikerItem) {
//                    Task {
//                        selectImage = try await pikerItem?.loadTransferable(type: Image.self)
//                    }
//                }
//            selectImage?
//                .resizable()
//                .scaledToFill()
            
            //选取多张
            PhotosPicker("Select images",selection: $pikerItems,maxSelectionCount: 3,matching: .images)
                .onChange(of: pikerItems) {
                    Task {
                        selectImages.removeAll()
                        for item in pikerItems {
                            if let loadedImage = try await item.loadTransferable(type: Image.self) {
                                selectImages.append(loadedImage)
                            }
                        }
                    }
                }
            ScrollView {
                ForEach (0..<selectImages.count,id: \.self) { i in
                
                    selectImages[i]
                        .resizable()
                        .scaledToFit()
                }
            }
            
            //定义标签
            PhotosPicker(selection: $pikerItems,maxSelectionCount: 3,matching: .images) {
                Label("Select a picture", systemImage: "photo")
            }
            //最后一种方法是限制可以导入的图片类型。我们在这里全面使用了.images，这意味着我们将获得常规照片、屏幕截图、全景图等。您可以使用.any().all()和.not()应用更高级的过滤器，并向它们传递一个数组
            PhotosPicker(selection: $pikerItems, maxSelectionCount: 3, matching: .any(of: [.images, .not(.screenshots)])) {
                Label("Select a picture", systemImage: "photo")
            }
            
        }
    }
}

#Preview {
    LoadingPhotos()
}
