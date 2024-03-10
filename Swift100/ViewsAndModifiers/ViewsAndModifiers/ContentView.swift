//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by liqiang on 2024/3/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
        .background(.red)
        
    }
}

#Preview {
    ContentView()
}
