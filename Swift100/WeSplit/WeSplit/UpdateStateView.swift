//
//  UpdateStateView.swift
//  WeSplit
//
//  Created by liqiang on 2024/3/5.
//

import SwiftUI

struct UpdateStateView: View {
   @State var tapCount = 0 //属性包装器，@State专为存储在一个视图中的简单属性而设计
    var body: some View {
        Button("Tap count:\(tapCount)") {
            self.tapCount += 1
        }
    }
}

#Preview {
    UpdateStateView()
}
