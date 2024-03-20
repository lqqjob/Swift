//
//  AnimatingGestures.swift
//  Animation
//
//  Created by liqiang on 2024/3/19.
//

import SwiftUI

struct AnimatingGestures: View {
    @State private var dragAmount = CGSize.zero
    var body: some View {
        LinearGradient(colors: [Color.yellow,Color.red], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300,height: 200)
            .clipShape(.rect(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged {
                        dragAmount = $0.translation
                    }
                    .onEnded { _ in
                        withAnimation(.bouncy) {
                            dragAmount = .zero
                        }
                    }
            )
            .animation(.bouncy,value: dragAmount)
    }
}


struct AnimatingGestures1 : View {
    let letters = Array("Hello Swift")
    @State private var enable = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        HStack {
            ForEach(0..<letters.count,id: \.self) {num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enable ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.linear.delay(Double(num)), value: dragAmount)
                
            }
        }
        .gesture(
            DragGesture()
                .onChanged {
                    dragAmount = $0.translation
                }
                .onEnded { _ in
                    dragAmount = .zero
                    enable.toggle()
                }
        )
    }
}

#Preview {
    AnimatingGestures1()
}
