//
//  BookwormApp.swift
//  Bookworm
//
//  Created by liqiang on 2024/4/1.
//

import SwiftUI
import SwiftData
@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for:Book.self)
    }
}
