//
//  LeaveAnAppStoreReview.swift
//  Instafilter
//
//  Created by liqiang on 2024/4/10.
//

import SwiftUI
import StoreKit
struct LeaveAnAppStoreReview: View {
    @Environment(\.requestReview) var requestReview
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    LeaveAnAppStoreReview()
}
