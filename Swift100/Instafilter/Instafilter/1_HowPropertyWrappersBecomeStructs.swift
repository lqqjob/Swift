//
//  HowPropertyWrappersBecomeStructs.swift
//  Instafilter
//
//  Created by liqiang on 2024/4/8.
//

import SwiftUI

struct HowPropertyWrappersBecomeStructs: View {
// 您刚刚看到State如何使用非突变设置器包装其值，这意味着blurAmount或包装它的State结构都没有改变——我们的绑定是直接更改内部存储值，这意味着属性观察器永远不会被触发。
    @State private var blurAmount = 0.0
    
    var body: some View {
        VStack {
            Text("Hello,World!")
                .blur(radius: blurAmount)
            Slider(value:$blurAmount,in: 0...20)
//            要解决这个问题，我们需要使用onChange()修饰符，该修饰符告诉SwiftUI在特定值发生变化时运行我们选择的函数
                .onChange(of: blurAmount) { oldValue, newValue in
                    print("New value is \(newValue)")
                }
                
            Button("Random Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

#Preview {
    HowPropertyWrappersBecomeStructs()
}
