//
//  AcceptingMulti-lineTextInputWithTextEditor.swift
//  Bookworm
//
//  Created by liqiang on 2024/4/1.
//

import SwiftUI

struct AcceptingMulti_lineTextInputWithTextEditor: View {
    
    @AppStorage("notes") private var notes = ""
    @AppStorage("notes") private var notes1 = ""

    var body: some View {
        NavigationStack {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
            
            Form {
                TextEditor(text: $notes1)
                    .navigationTitle("Notes")
                    .padding()
            }
            
            Form {
                TextField("Enter your text",text: $notes,axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .navigationTitle("Notes")
                    .padding()
            }
            
        }
    }
}

#Preview {
    AcceptingMulti_lineTextInputWithTextEditor()
}
