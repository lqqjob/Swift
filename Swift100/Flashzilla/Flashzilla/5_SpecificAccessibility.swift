//
//  5_SpecificAccessibility.swift
//  Flashzilla
//
//  Created by liqiang on 2024/6/14.
//

import SwiftUI

struct SpecificAccessibility: View {
    //不使用颜色区分
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    //减少动画
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    
    //降低透明度
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @State private var scale = 1.0
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            Text("success")
        }
        .padding()
        .background(differentiateWithoutColor ? .black : .green)
        .foregroundColor(.white)
        .clipShape(.capsule)
        
        Button("Hello,World") {
            withOptionalAnimation {
                scale *= 1.5
            }
        }
        .scaleEffect(scale)
        
        Spacer().frame(height: 50)
        
        Text("Hello,World")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(.capsule)
    }
}

func withOptionalAnimation<Result>(_ animation:Animation? = .default,_ body:() throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}


#Preview {
    SpecificAccessibility()
}
