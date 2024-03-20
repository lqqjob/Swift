//
//  ControllingTheAnimationStack.swift
//  Animation
//
//  Created by liqiang on 2024/3/19.
//

import SwiftUI

struct ControllingTheAnimationStack: View {
    @State private var enable = false;
    var body: some View {
        Button("Tap Me") {
            enable.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enable ? .red: .blue)
        .animation(.default, value: enable)
        .foregroundStyle(.white)
        .clipShape(.rect(cornerRadius: enable ? 60 : 0))
        .animation(.spring(duration:1,bounce: 0.6), value: enable)
    }
}

#Preview {
    ControllingTheAnimationStack()
}
