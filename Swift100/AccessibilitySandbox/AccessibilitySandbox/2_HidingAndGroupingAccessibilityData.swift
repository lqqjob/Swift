//
//  HidingAndGroupingAccessibilityData.swift
//  AccessibilitySandbox
//
//  Created by liqiang on 2024/4/27.
//

import SwiftUI

struct HidingAndGroupingAccessibilityData: View {
    var body: some View {
        Image(decorative: "character")
            .accessibilityHidden(true)
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .combine)
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Your score is 1000")
        
    }
}

#Preview {
    HidingAndGroupingAccessibilityData()
}
