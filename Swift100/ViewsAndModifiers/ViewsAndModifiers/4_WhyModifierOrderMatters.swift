//
//  WhyModifierOrderMatters.swift
//  ViewsAndModifiers
//
//  Created by liqiang on 2024/3/10.
//

import SwiftUI

/*
 几乎每次我们对SwiftUI视图应用修饰符时，我们实际上都会创建一个应用该更改的新视图——我们不只是修改现有的视图。如果您想一想，这种行为是有意义的：我们的视图只保存我们赋予它们的确切属性，因此，如果我们设置背景颜色或字体大小，就没有地方存储该数据。
 */

struct WhyModifierOrderMatters: View {
    var body: some View {
        
        /*
         你可以在这里看到两样东西：

         每次我们修改视图时，SwiftUI都会使用泛型：ModifiedContent<OurThing, OurModifier>应用该修饰符。
         当我们应用多个修饰符时，它们只是堆叠起来：ModifiedContent<ModifiedContent<…
         要阅读类型是什么，请从最里面的类型开始，然后走出去：

         最里面的类型是ModifiedContent<Button<Text>, _BackgroundStyleModifier<Color>：我们的按钮有一些应用了背景颜色的文本。
         围绕这一点，我们有ModifiedContent<…, _FrameLayout>，它采用我们的第一个视图（按钮+背景颜色），并给它一个更大的框架。
         如您所见，我们以ModifiedContent类型堆叠结束——每个类型都采用要转换的视图以及要进行的实际更改，而不是直接修改视图。
         */
        
        Button(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/) {
            print(type(of: self.body))
        }
            .background(.red)
            .frame(width:200,height: 200)
        
        Text("Hello,world")
            .padding()
            .background(.red)
            .padding()
            .background(.blue)
            .padding()
            .background(.green)
            .padding()
            .background(.yellow)
    }
}

#Preview {
    WhyModifierOrderMatters()
}
