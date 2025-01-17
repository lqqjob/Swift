//
//  Appstorage.swift
//  iAppStore
//
//  Created by liqiang on 17/01/2025.
//

import SwiftUI

struct Appstorage: View {
    @AppStorage("userName") private var userName:String = "Guest"
    var body: some View {
        VStack{
            Text("Hello,\(userName)")
            Button("Change UserName") {
                userName = "Alice"
            }
        }
    }
}

#Preview {
    Appstorage()
}
