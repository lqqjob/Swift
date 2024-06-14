//
//  Timer.swift
//  Flashzilla
//
//  Created by liqiang on 2024/6/14.
//

import SwiftUI

struct TimerView: View {
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    var body: some View {
        Text("Hello, World!")
            .onReceive(timer, perform: { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                }else {
                    print("The time is now \(time)")
                }
                counter += 1
            })
    }
}

#Preview {
    TimerView()
}
