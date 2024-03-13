//
//  EnteringNumbersWithStepper.swift
//  BetterRest
//
//  Created by liqiang on 2024/3/13.
//

import SwiftUI

struct EnteringNumbersWithStepper: View {
    @State private var sleepAmount = 8.0
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount,in: 4...12,step: 0.25)
        Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount,in: 4...12,step: 0.25)
            .labelsHidden()
    }
}

#Preview {
    EnteringNumbersWithStepper()
}
