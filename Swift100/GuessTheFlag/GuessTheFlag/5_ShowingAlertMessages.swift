//
//  ShowingAlertMessages.swift
//  GuessTheFlag
//
//  Created by liqiang on 2024/3/9.
//

import SwiftUI

struct ShowingAlertMessages: View {
    @State private var showingAlert = false
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Import message", isPresented: $showingAlert) {
            Button("Delete", role: .destructive) { }
            Button("Cancel", role: .cancel) { }
        }
        
        Button("Show Alert") {
            showingAlert = true
        }
        .alert("Import Message",isPresented: $showingAlert) {
            Button("OK",role: .cancel) {
                
            }
        } message: { // 您可以添加消息文本，以与标题一起进行第二个尾随结束
            Text("Please read this")
        }
    }
}

#Preview {
    ShowingAlertMessages()
}
