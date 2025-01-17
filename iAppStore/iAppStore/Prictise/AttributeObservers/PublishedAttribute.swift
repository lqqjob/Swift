//
//  Published.swift
//  iAppStore
//
//  Created by liqiang on 17/01/2025.
//
import Foundation

import SwiftUI
class PublishClass: ObservableObject {
    @Published var name:String = "Hello";
}
struct PublishedAttribute: View {
    @ObservedObject private var viewModel = PublishClass()
    
    var body: some View {
        VStack {
            Text(viewModel.name)
            Button("Change Name") {
                viewModel.name = "Bob"
            }
        }
    }
}

#Preview {
    PublishedAttribute()
}
