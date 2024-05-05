//
//  BucketListApp.swift
//  BucketList
//
//  Created by liqiang on 2024/4/20.
//

import SwiftUI

@main
struct BucketListApp: App {
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) {  newScenePhase in
            if newScenePhase == .background {
                print("newScenePhase.background")
            }else if newScenePhase == .active {
                print("newScenePhase.active")

            }else if newScenePhase == .inactive {
                print("newScenePhase.inactive")

            }
            
//            if oldScenePhase == .background {
//                print("oldScenePhase.background")
//            }else if oldScenePhase == .active {
//                print("oldScenePhase.active")
//
//            }else if oldScenePhase == .inactive {
//                print("oldScenePhase.inactive")
//
//            }
        }
  
    }
}
