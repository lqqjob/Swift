//
//  CreatingExplicitAnimations.swift
//  Animation
//
//  Created by liqiang on 2024/3/18.
//

import SwiftUI

struct CreatingExplicitAnimations: View {
    @State private var animationAmount = 0.0
    var body: some View {
        Button("Tap Me") {
            withAnimation(.spring(duration:1,bounce: 0.5)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(.circle)
        .rotation3DEffect(
            .degrees(animationAmount),
                                  axis: (x: 0.0, y: 1.0, z: 1.0)
        )
    }
}

#Preview {
    CreatingExplicitAnimations()
}
