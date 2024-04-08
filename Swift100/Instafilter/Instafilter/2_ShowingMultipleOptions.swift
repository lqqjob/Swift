//
//  ShowingMultipleOptions.swift
//  Instafilter
//
//  Created by liqiang on 2024/4/8.
//

import SwiftUI

struct ShowingMultipleOptions: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Button("Hello, World!") {
            showingConfirmation = true
        }
        .foregroundStyle(.black)
        .frame(width:300,height: 300)
        .background(backgroundColor)
        .confirmationDialog("Change background", isPresented: $showingConfirmation) {
            Button("Red") { backgroundColor = .red }
               Button("Green") { backgroundColor = .green }
               Button("Blue") { backgroundColor = .blue }
               Button("Cancel", role: .cancel) { }
        } message: {
            Text("Select a new color")

        }

    }
}

#Preview {
    ShowingMultipleOptions()
}
