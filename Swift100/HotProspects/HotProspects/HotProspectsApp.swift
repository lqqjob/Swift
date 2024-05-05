//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by liqiang on 2024/5/1.
//

import SwiftUI
import SwiftData
@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for:Prospect.self)
    }
}
