//
//  ShowingAndHidingViews.swift
//  iExpense
//
//  Created by liqiang on 2024/3/20.
//

import SwiftUI

struct ShowingAndHidingViews: View {
    @State private var showingSheet = false
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "Hello")
        }
    }
}


struct SecondView : View {
    
    @Environment(\.dismiss) var dismiss
    
    let name : String;
    var body: some View {
        Text(name);
        Button("Dismiss") {
            dismiss()
        }
    }
}

#Preview {
    ShowingAndHidingViews()
}
