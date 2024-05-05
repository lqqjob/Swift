//
//  SelectItemsInList.swift
//  HotProspects
//
//  Created by liqiang on 2024/5/1.
//

import SwiftUI

struct SelectItemsInList: View {
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    @State private var selection:String?
    var body: some View {
        List(users,id: \.self,selection: $selection) {user in
            Text(user)
        }
    }
}

#Preview {
    SelectItemsInList()
}
