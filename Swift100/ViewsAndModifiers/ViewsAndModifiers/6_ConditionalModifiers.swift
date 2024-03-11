//
//  ConditionalModifiers.swift
//  ViewsAndModifiers
//
//  Created by liqiang on 2024/3/11.
//

import SwiftUI

struct ConditionalModifiers: View {
    @State private var useRedText = false
    var body: some View {
        
        Button("Hello world") {
            useRedText.toggle()
        }
        .foregroundColor(useRedText ? .red : .blue)
        
      
    }
}

#Preview {
    ConditionalModifiers()
}
