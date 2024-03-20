//
//  ShowingAndHidingViewsWithTransitions.swift
//  Animation
//
//  Created by liqiang on 2024/3/20.
//

import SwiftUI

struct ShowingAndHidingViewsWithTransitions: View {
    @State private var isShowingRed = false
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width:200,height: 200)
//                    .transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
            
        }
    }
}

#Preview {
    ShowingAndHidingViewsWithTransitions()
}
