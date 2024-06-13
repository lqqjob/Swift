//
//  AlvesHitTesting.swift
//  Flashzilla
//
//  Created by liqiang on 2024/6/13.
//

import SwiftUI

struct AlvesHitTesting: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300,height: 300)
                .onTapGesture {
                    print("Rectangle tapped!")
                }
            Circle()
                .fill(.red)
                .frame(width: 300,height: 300)
                .onTapGesture {
                    print("Circle tapped!")
                }
                .allowsHitTesting(false)//不响应手势
        }
        
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(.rect)//如果我们在VStack上使用contentShape(.rect)，那么堆栈的整个区域都可以点击，包括间隔
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview {
    AlvesHitTesting()
}
