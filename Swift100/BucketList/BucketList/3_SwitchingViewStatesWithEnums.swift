//
//  SwitchingViewStatesWithEnums.swift
//  BucketList
//
//  Created by liqiang on 2024/4/20.
//

import SwiftUI
enum LoadingState1 {
    case loading,success,failed
}
struct LoadingView:View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView:View {
    var body: some View {
        Text("Success!")
    }
}

struct FailedView:View {
    var body: some View {
        Text("Failed.")
    }
}
struct SwitchingViewStatesWithEnums: View {
    @State private var loadingState = LoadingState1.loading
    var body: some View {
        switch loadingState {
        case .loading:
            LoadingView()
        case .success:
            SuccessView()
        case .failed:
            FailedView()
        }
    }
}

#Preview {
    SwitchingViewStatesWithEnums()
}
