//
//  DisablingForms.swift
//  CupcakeCorner
//
//  Created by liqiang on 2024/3/27.
//

import SwiftUI

struct DisablingForms: View {
    @State private var userName = ""
    @State private var email = ""
    var disableForm:Bool {
        userName.count < 5 || email.count < 5
    }
    var body: some View {
        Form {
            Section {
                TextField("Username：",text: $userName)
                TextField("Email",text: $email)
            }
            Section {
                Button("Create account") {
                    print("Create account...")
                }
            }
            .disabled(disableForm)
        }
    }
}

#Preview {
    DisablingForms()
}
