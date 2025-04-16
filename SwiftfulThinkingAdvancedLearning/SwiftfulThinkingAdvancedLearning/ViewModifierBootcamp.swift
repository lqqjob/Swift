//
//  ViewModifierBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 4/16/25.
//

import SwiftUI

struct DefaultButtonModifier: ViewModifier {
    let backgoundColor:Color
    func body(content: Content) -> some View {
        content
            .foregroundStyle(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgoundColor)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

extension View {
    func withDefaultButtonFormatting(backgroudColor:Color = .blue) -> some View {
        modifier(DefaultButtonModifier(backgoundColor: backgroudColor))
    }
}

struct ViewModifierBootcamp: View {
    var body: some View {
        VStack (spacing: 30) {
            Text("Hello word!")
                .font(.headline)
                .withDefaultButtonFormatting(backgroudColor: .orange)
            
            Text("Hello everyone!")
                .font(.headline)
                .withDefaultButtonFormatting()
            
            Text("Hello!!!")
                .font(.title)
                .withDefaultButtonFormatting(backgroudColor: .red)
        }
        .padding()
    }
}

#Preview {
    ViewModifierBootcamp()
}
