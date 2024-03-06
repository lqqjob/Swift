//
//  AddNavigation.swift
//  WeSplit
//
//  Created by liqiang on 2024/3/5.
//

import SwiftUI

struct AddNavigation: View {
    var body: some View {
        NavigationStack {
            Form{
                Section {
                    Text("Hello,wold")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline) //修改小字体
        }
    }
}

#Preview {
    AddNavigation()
}
