//
//  ColorsAndFrames.swift
//  GuessTheFlag
//
//  Created by liqiang on 2024/3/8.
//

import SwiftUI

struct ColorsAndFrames: View {
    var body: some View {
        ZStack {
            Color.cyan.frame(width:200,height: 200)
            Color.cyan.frame(minWidth: 300,maxWidth: .infinity,maxHeight: 200) //本身是一个视图,可设置大小
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .background(.yellow)
        }
        .background(.red)//背景颜色
        .ignoresSafeArea()
        
        ZStack {
            VStack(spacing:0) {
                Color.red
                Color.blue
            }
            Text("Content")
                .foregroundStyle(.secondary)
                .padding(50)
                .background(.ultraThinMaterial)//background()修饰符也可以接受材料,这就是磨砂
        }
        .ignoresSafeArea()

        
    }
}

#Preview {
    ColorsAndFrames()
}
