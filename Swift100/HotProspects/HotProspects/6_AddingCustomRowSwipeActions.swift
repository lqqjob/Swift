//
//  AddingCustomRowSwipeActions.swift
//  HotProspects
//
//  Created by liqiang on 2024/5/3.
//

import SwiftUI

struct AddingCustomRowSwipeActions: View {
    var body: some View {
        List {
            Text("Tayloy Swift")
                .swipeActions {
                    Button("Send message",systemImage: "message") {
                        print("Hi")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin",systemImage: "pin") {
                        print("Pinning")
                    }
                    .tint(.orange)
                }
        }
    }
}

#Preview {
    AddingCustomRowSwipeActions()
}
