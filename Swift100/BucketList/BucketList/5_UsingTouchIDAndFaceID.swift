//
//  UsingTouchIDAndFaceID.swift
//  BucketList
//
//  Created by liqiang on 2024/4/20.
//

import SwiftUI
import LocalAuthentication
struct UsingTouchIDAndFaceID: View {
    @State private var isUnlocked = false
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error:NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                if success {
                    isUnlocked = true
                }else {
                    
                }
            }
        }else {
            
        }
    }
}

#Preview {
    UsingTouchIDAndFaceID()
}
