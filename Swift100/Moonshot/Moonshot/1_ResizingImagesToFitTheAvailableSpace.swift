//
//  ResizingImagesToFitTheAvailableSpace.swift
//  Moonshot
//
//  Created by liqiang on 2024/3/22.
//

import SwiftUI

struct ResizingImagesToFitTheAvailableSpace: View {
    var body: some View {
       Image("apollo14")
            .resizable()//调整图像内容的大小
            .scaledToFill()//图像按比例调整大小
//            .frame(width:300,height: 300)
            .containerRelativeFrame(.horizontal) {size,axis in
                size * 0.8
                
            }
    }
}

#Preview {
    ResizingImagesToFitTheAvailableSpace()
}
