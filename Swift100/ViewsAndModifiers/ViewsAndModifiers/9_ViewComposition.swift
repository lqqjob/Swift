//
//  ViewComposition.swift
//  ViewsAndModifiers
//
//  Created by liqiang on 2024/3/11.
//

import SwiftUI

struct ViewComposition: View {
    
    struct CapsuleText: View {
        var text:String
        var body: some View {
            Text(text)
                .font(.largeTitle)
                .padding()
                .background(.blue)
                .clipShape(.capsule)
        }
    }
    
    var body: some View {
        VStack {
            Text("First")
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(.capsule)
            Text("Second")
                .font(.largeTitle)
                .padding()
                .foregroundStyle(.white)
                .background(.blue)
                .clipShape(.capsule)
        }
        
        VStack {
            CapsuleText(text: "Third")
                .foregroundColor(.red)
            CapsuleText(text: "Four")
                .foregroundColor(.yellow)
        }
        
    }
}

#Preview {
    ViewComposition()
}
