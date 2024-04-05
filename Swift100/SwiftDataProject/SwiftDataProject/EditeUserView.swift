//
//  EditeUserView.swift
//  SwiftDataProject
//
//  Created by liqiang on 2024/4/5.
//

import SwiftUI
import SwiftData
struct EditeUserView: View {
    @Bindable var user:User
    var body: some View {
        Form {
            TextField("Name",text: $user.name)
            TextField("City",text: $user.city)
            DatePicker("Join Date",selection: $user.joinDate)
        }
        .navigationTitle("Edit User")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let user = User(name: "Taylor Swift", city: "Nashville", joinDate: .now)
        return  EditeUserView(user: user)
            .modelContainer(container)
    } catch {
        return Text("Failed to create container: \(error.localizedDescription)")
    }
}
