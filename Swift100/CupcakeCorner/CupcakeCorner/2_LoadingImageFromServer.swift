//
//  LoadingImageFromServer.swift
//  CupcakeCorner
//
//  Created by liqiang on 2024/3/27.
//

import SwiftUI

struct LoadingImageFromServer: View {
    var body: some View {
        //可以提前告诉SwiftUI，我们正在尝试加载3倍比例的图像
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"),scale: 3)
//        如果你想给它一个精确的尺寸？好吧，那么你可以先试试这个：没用
//        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png"))
//            .frame(width: 200,height: 200)
        AsyncImage(url: URL(string: "https://hws.dev/img/logo.png")){phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
            }else if phase.error != nil {
                Text("There was an error loading the image.")

            } else {
                ProgressView()
            }
            
        }
        .frame(width: 200,height: 200)
    }
}

#Preview {
    LoadingImageFromServer()
}
