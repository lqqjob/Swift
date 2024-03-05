//
//  ContentView.swift
//  WeSplit
//
//  Created by liqiang on 2024/3/5.
//

import SwiftUI

struct ContentView: View {
    var body: some View {// body计算属性
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
