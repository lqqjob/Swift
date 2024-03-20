//
//  StoringUserSettingsWithUserDefaults.swift
//  iExpense
//
//  Created by liqiang on 2024/3/20.
//

import SwiftUI

struct StoringUserSettingsWithUserDefaults: View {
    
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    @AppStorage("tapCount1") private var tapCount1 = 0
    
    var body: some View {
        Button("Tap count:\(tapCount)") {
            tapCount += 1
            UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
        
        Button("Tap count:\(tapCount1)") {
            tapCount1 += 1
        }
    }
}

#Preview {
    StoringUserSettingsWithUserDefaults()
}
