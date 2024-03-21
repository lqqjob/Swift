//
//  ArchivingSwiftObjectsWithCodable.swift
//  iExpense
//
//  Created by liqiang on 2024/3/20.
//

import SwiftUI

struct People: Codable {
    let userName:String
    let lastName:String
}

struct ArchivingSwiftObjectsWithCodable: View {
    @State private var user = People(userName: "Taylor", lastName: "Swift")
    var body: some View {
        Text("Hello, World!")
        Button("Save User") {
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.set(data,forKey: "UserData")//这直接访问UserDefaults而不是通过@AppStorage，因为@AppStorage属性包装器在这里不起作用。
            }
        }
    }
}

#Preview {
    ArchivingSwiftObjectsWithCodable()
}
