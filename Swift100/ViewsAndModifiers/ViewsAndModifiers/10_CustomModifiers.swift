//
//  CustomModifiers.swift
//  ViewsAndModifiers
//
//  Created by liqiang on 2024/3/11.
//

import SwiftUI

/// 1、要创建自定义修饰符，请创建一个符合ViewModifier协议的新结构。这只有一个要求，即一种称为body的方法，接受它要处理的任何内容，并且必须返回some View。
struct Title:ViewModifier {
    func body(content:Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}


extension View {//在使用自定义修饰符时，在View上创建使其更易于使用的扩展通常是一个明智的主意
    func titleStyle() -> some View {
        modifier(Title())
    }
}


/// 2、自定义修饰符可以做的不仅仅是应用其他现有的修饰符，它们还可以根据需要创建新的视图结构。请记住，修饰符返回新对象，而不是修改现有对象，因此我们可以创建一个将视图嵌入堆栈并添加另一个视图的对象：

struct Watermark:ViewModifier {
    
    var text: String
    
    func body(content: Content) -> some View {
        ZStack {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

//人们经常想知道，添加自定义视图修饰符比仅向View添加新方法更好，实际上，这归结为一个主要原因：自定义视图修饰符可以拥有自己的存储属性，而View的扩展不能。
extension View {
    func watermarked(width text:String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct CustomModifiers: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .modifier(Title())//与modifier()修饰符一起使用——是的，它是一个名为“修饰符”的修饰符
        Text("Hello,world")
            .titleStyle()
        
        Color.blue
            .frame(width: 300,height: 300)
            .watermarked(width: "lqq with swift")
    }
}

#Preview {
    CustomModifiers()
}
