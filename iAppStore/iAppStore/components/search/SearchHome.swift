//
//  SearchHome.swift
//  iAppStore
//
//  Created by liqiang on 20/01/2025.
//

import SwiftUI

struct SearchHome: View {
    @State private var isSearching = false
    @State private var searchText = ""
    @AppStorage("kSearchRegionName") private var regionName:String = "中国"
    @State private var filterViewIsExpanded = false
    @StateObject private var appModel = AppDetailModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SearchHome()
}
