//
//  4_ControllingImageInterpolation.swift
//  HotProspects
//
//  Created by liqiang on 2024/5/1.
//

import SwiftUI

struct ControllingImageInterpolation: View {
    var body: some View {
        Image(.example)
            .interpolation(.none)
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    ControllingImageInterpolation()
}
