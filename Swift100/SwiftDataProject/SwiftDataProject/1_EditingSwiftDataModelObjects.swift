//
//  EditingSwiftDataModelObjects.swift
//  SwiftDataProject
//
//  Created by liqiang on 2024/4/5.
//

import SwiftUI
import SwiftData
struct EditingSwiftDataModelObjects: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort:\User.name) var users:[User]
    @State private var path = [User]()
    var body: some View {
        NavigationStack(path:$path) {
            List(users) { user in
                NavigationLink(value:user) {
                    Text(user.name)
                }
                
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditeUserView(user: user)
            }
            .toolbar {
                Button("Add user",systemImage: "plus") {
                    let user = User(name: "", city: "", joinDate: .now)
                    modelContext.insert(user)
                    path = [user]
                }
            }
        }
    }
}

#Preview {
    EditingSwiftDataModelObjects()
}
