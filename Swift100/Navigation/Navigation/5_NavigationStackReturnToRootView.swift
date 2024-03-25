//
//  5_NavigationStackReturnToRootView.swift
//  Navigation
//
//  Created by liqiang on 2024/3/25.
//

import SwiftUI

struct NavigationStackReturnToRootView: View {
    @State private var path = [Int]()
    var body: some View {
        NavigationStack(path:$path) {
            DetailView5(number: 0,path: $path)
                .navigationDestination(for: Int.self) { i in
                    DetailView5(number: i,path: $path)
                }
        }
    }
}



struct DetailView5 : View {
    var number:Int
    @Binding var path:[Int]
    var body: some View {
        NavigationLink("Go to Random Number",value: Int.random(in: 1...10000))
            .navigationTitle("Number:\(number)")
            .toolbar(content: {
                Button("Home") {
                    path.removeAll()
                }
            })
    }
}

#Preview {
    NavigationStackReturnToRootView()
}
