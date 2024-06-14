//
//  NotifiedAppMovesBackground.swift
//  Flashzilla
//
//  Created by liqiang on 2024/6/14.
//

import SwiftUI

struct NotifiedAppMovesBackground: View {
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
        Text("Hello, World!")
            .onChange(of: scenePhase) { oldValue, newValue in
                if newValue == .active {
                    print("Active")

                }else if newValue == .inactive {
                    print("Inactive")

                }else if newValue == .background {
                    print("Background")

                }
            }
    }
}

#Preview {
    NotifiedAppMovesBackground()
}
