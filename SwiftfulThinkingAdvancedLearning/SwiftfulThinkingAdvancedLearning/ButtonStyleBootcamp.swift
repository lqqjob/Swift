//
//  ButtonStyleBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 4/16/25.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {
    let scaleAmount:CGFloat
    
    init(scaleAmount: CGFloat) {
        self.scaleAmount = scaleAmount
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scaleAmount : 1.0)
            .brightness(configuration.isPressed ? 0.1 : 0)
//            .opacity(configuration.isPressed ? 0.9 : 1)
    }
}

extension  Button {
    func withPressableStyle(scaleAmount:CGFloat = 0.9) -> some View {
        buttonStyle(PressableButtonStyle(scaleAmount: scaleAmount))
    }
}

struct ButtonStyleBootcamp: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click me")
                .font(.headline)
                .withDefaultButtonFormatting()
        }
        .withPressableStyle(scaleAmount: 0.9)
        .padding(40)
    
    }
}

#Preview {
    ButtonStyleBootcamp()
}
