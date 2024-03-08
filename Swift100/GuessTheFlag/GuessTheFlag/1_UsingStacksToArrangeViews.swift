//
//  UsingStacksToArrangeViews.swift
//  GuessTheFlag
//
//  Created by liqiang on 2024/3/7.
//

import SwiftUI

/*
 如果我们想返回多样东西，我们有各种选择，但有三个特别有用。它们是HStack、VStack和ZStack，它们处理水平、垂直和竖直。
 */

struct UsingStacksToArrangeViews: View {
    var body: some View {
        Section {
            VStack(spacing:20) { //spacing:明确允许我们指定视图之间放置多少空间
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello,world")
            }
            .padding()
        }
        
        Section {
            VStack(alignment: .leading) { //alignment:允许我们指定对齐方式
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello,world")
            }
            .padding()
        }
        
        Section {
            HStack(spacing:20) {// HStack 跟VStack 用法一样
                Text("Hello, world!")
                Text("This is inside a stack")
            }
        }
    }
}

#Preview {
    UsingStacksToArrangeViews()
}
