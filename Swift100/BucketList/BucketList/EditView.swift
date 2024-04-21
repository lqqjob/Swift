//
//  EditView.swift
//  BucketList
//
//  Created by liqiang on 2024/4/21.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    
    var location:Location1
    @State private var name:String
    
    @State private var description:String
    
    var onSave:(Location1) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section{
                    TextField("Place name",text: $name)
                    TextField("Description",text: $description)
                }
            }
            .navigationTitle("Place details")
            .toolbar(content: {
                Button("Save") {
                    var newLocation = location
                    newLocation.name = name
                    newLocation.id = UUID()
                    newLocation.description = description
                    onSave(newLocation)
                    dismiss()
                }
            })
        }
    }
//    @escaping部分很重要，这意味着该函数稍后会为用户藏匿，而不是立即调用，这里需要它，因为只有当用户按下Save键时，onSave函数才会被调用。
    init(location:Location1,onSave: @escaping (Location1) -> Void) {
        self.location = location
        self.onSave = onSave
        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
}

#Preview {
    EditView(location: .example) {_ in
        
    }
}
