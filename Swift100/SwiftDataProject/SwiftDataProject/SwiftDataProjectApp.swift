//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by liqiang on 2024/4/5.
//

import SwiftUI
import SwiftData
@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            EditingSwiftDataModelObjects()
        }
        .modelContainer(for:User.self)
    }
}
