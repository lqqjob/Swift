//
//  RelationshipsWithSwiftDataSwiftUIAndQuery.swift
//  SwiftDataProject
//
//  Created by liqiang on 2024/4/6.
//

import SwiftUI
import SwiftData
struct RelationshipsWithSwiftDataSwiftUIAndQuery: View {
    @Query private var users:[User]
    @Environment(\.modelContext) var modelContext
    var body: some View {
        List(users) { user in
            HStack {
                Text(user.name)
                Spacer()
                Text(String(user.jobs.count))
                    .fontWeight(.black)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(.blue)
                                .foregroundStyle(.white)
                                .clipShape(.capsule)
            }
            
        }
    }
}

#Preview {
    RelationshipsWithSwiftDataSwiftUIAndQuery()
}
