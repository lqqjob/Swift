//
//  3_AddingHapticEffects.swift
//  CupcakeCorner
//
//  Created by liqiang on 2024/3/28.
//

import SwiftUI

struct AddingHapticEffects: View {
    @State private var counter = 0
    var body: some View {
        Button("Tap Count:\(counter)") {
            counter += 1
        }
        //.increase是内置的触觉反馈变体之一，最好在增加计数器等值时使用。还有很多其他可供选择，包括.success、.warning、.error、.start、.stop等。
        .sensoryFeedback(.increase, trigger: counter)
    }
}

#Preview {
    AddingHapticEffects()
}
