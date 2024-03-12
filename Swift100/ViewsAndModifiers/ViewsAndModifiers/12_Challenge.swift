//
//  Challenge.swift
//  ViewsAndModifiers
//
//  Created by liqiang on 2024/3/12.
//

import SwiftUI

struct TitleBlue:ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.blue)
            .font(.largeTitle)
    }
}


extension View {
    func largeBlueTitle() -> some View {
        modifier(TitleBlue())
    }
}

struct Challenge: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .largeBlueTitle()
    }
}

#Preview {
    Challenge()
}
