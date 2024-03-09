//
//  ButtonsAndImages.swift
//  GuessTheFlag
//
//  Created by liqiang on 2024/3/8.
//

import SwiftUI

struct ButtonsAndImages: View {
    func executeDelete() {
        print("Now deleting...")
    }
    
    var body: some View {
        
        ///1、制作按钮的最简单方法是我们之前看过的：当它只包含一些文本时，您在按钮标题中传递，以及点击按钮时应运行的闭包
        
        Button("Delete selection") {
            print("Now deleting…")
        }
        
        Button("Delete selection",action: executeDelete)//这可能是任何函数，而不仅仅是一个闭包
        
        Button("Delete selection",role: .destructive,action: executeDelete)
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/) // 首先，我们可以在按钮上附加一个角色，iOS可以使用该角色在视觉上和屏幕阅读器上调整其外观
        
        Button("Button1") {}
        .buttonStyle(.bordered)
        
        Button("Button2",role: .destructive) {}
        .buttonStyle(.bordered)
        
        Button("Button3") {}
        .buttonStyle(.borderedProminent)
        
        Button("Button4",role: .destructive) {}
        .buttonStyle(.borderedProminent)
        
        Button("Button Border Color") {}
            .buttonStyle(.borderedProminent)
            .tint(.mint)//定义边框按钮颜色
        
        Button {
            
        } label: {// 如果您想要完全自定义的东西，您可以使用第二个尾随闭包传递自定义标签
            Text("Tap me")
                .padding(10)
                .foregroundColor(.white)
                .background(.red)
        }
        
        /// 2、SwiftUI有一个专用Image类型，用于处理应用程序中的图片，您可以通过三种主要方式创建它们
        
        Image("pencil") //将加载您添加到项目中的名为“铅笔”的图像
        Image(decorative: "pencil")//将加载相同的图像，但不会为启用屏幕阅读器的用户读出它。这对于不传达其他重要信息的图像很有用
        Image(systemName: "pencil")//将加载iOS内置的铅笔图标
        
        Button("Edit",systemImage: "pencil") {
            print("Edit button was tapped")
        }
        Button {
            print("Edit button was tapped")
        } label: {
            Label("Eidt",systemImage: "pencil")
                .padding()
                .foregroundColor(.white)
                .background(.red)
        }//Button 同时显示文字和图标的两种方式
    }
}

#Preview {
    ButtonsAndImages()
}
