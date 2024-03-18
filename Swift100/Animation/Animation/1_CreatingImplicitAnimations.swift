//
//  CreatingImplicitAnimations.swift
//  Animation
//
//  Created by liqiang on 2024/3/18.
//

import SwiftUI

struct CreatingImplicitAnimations: View {
    @State private var animationAmount = 1.0
    var body: some View {
        Button("Tap me") {
           animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .blur(radius: (animationAmount - 1) * 3)
        .animation(.default, value: animationAmount)

    }
}

#Preview {
    CreatingImplicitAnimations()
}
