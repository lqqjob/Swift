//
//  ObservedObjectAttribute.swift
//  iAppStore
//
//  Created by liqiang on 17/01/2025.
//

import SwiftUI

class Counter:ObservableObject {
    @Published var value:Int = 0
}

struct ParentView:View {
    @StateObject private var counter = Counter()
    var body:some View {
        ChildView(counter: counter)
    }
}
struct ChildView:View {
    @ObservedObject var counter:Counter
    var body: some View {
        VStack {
            Text("Count:\(counter.value)")
            Button("Increment") {
                counter.value += 1
            }
        }
    }
}

struct ObservedObjectAttribute: View {
    var body: some View {
        ParentView()
    }
}

#Preview {
    ObservedObjectAttribute()
}
