//
//  CustomizingAnimationsInSwiftUI.swift
//  Animation
//
//  Created by liqiang on 2024/3/18.
//

import SwiftUI

struct CustomizingAnimationsInSwiftUI: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap me") {
//           animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
//        .animation(.default, value: animationAmount)
//         或多或少地反弹和向前反弹，其中1是最大弹性，0是没有弹性
//        .animation(.spring(duration: 0.1,bounce: 0.9), value: animationAmount)
//        
//        我们还可以要求动画重复一定次数，甚至通过将autoreverses设置为真来使其反弹和向前反弹。这会创建一个一秒钟的动画，在达到最终大小之前会上下弹跳
//        .animation(.easeInOut(duration: 1)
//                        .repeatCount(3, autoreverses: true),
//                   value: animationAmount)
        
//        对于连续动画，有一个repeatForever()修饰符可以像这样使用
//        我们可以将这些repeatForever()动画与onAppear()结合使用，以制作立即开始的动画，并在视图的生命周期内继续制作动画。
//        .animation(.easeIn(duration: 1)
//            .repeatForever(autoreverses: true), value: animationAmount)
        
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2-animationAmount)
                .animation(
                    .easeInOut(duration: 1)
                    .repeatForever(autoreverses: false),
                    value: animationAmount
                )
                
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

#Preview {
    CustomizingAnimationsInSwiftUI()
}
