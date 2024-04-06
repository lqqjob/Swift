//
//  FilteringQueryUsingPredicate.swift
//  SwiftDataProject
//
//  Created by liqiang on 2024/4/5.
//

import SwiftUI
import SwiftData
struct FilteringQueryUsingPredicate: View {
    @Environment(\.modelContext) var modelContext
    @Query(filter:#Predicate<User> {user in
        if user.name.localizedStandardContains("R") {
            if user.city == "London" {
                return true
            }else {
                return false
            }
        }else {
            return false
        }
    } ,sort:\User.name) var users:[User]
    @State private var path = [User]()
    @State private var showingUpcomingonly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate),
    ]
    var body: some View {
        NavigationStack(path:$path) {
            UsersView(minimumJoinDate: showingUpcomingonly ? .now : .distantPast,sortOrder: sortOrder)
            .navigationTitle("Users")
            .navigationDestination(for: User.self) { user in
                EditeUserView(user: user)
            }
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model:User.self)
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Johnny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                }
                Button(showingUpcomingonly ? "Show Everyone" : "Show Upcoming") {
                    showingUpcomingonly.toggle()
                }
                
                Menu("Sort",systemImage: "arrow.up.arrow.down") {
                    Picker("Sort",selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate),
                            ])
                        Text("Sort by Join Date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name),
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    FilteringQueryUsingPredicate()
}
