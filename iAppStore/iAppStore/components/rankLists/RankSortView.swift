//
//  RankSortView.swift
//  iAppStore
//
//  Created by liqiang on 3/27/25.
//

import SwiftUI

struct RankSortView: View {
    
    public enum RankSortType:Int {
        case noneType
        case rankType
        case categoryType
        case regionType
    }
    
    @Binding var rankName:String
    @Binding var categoryName:String
    @Binding var regionName:String
    
    @State private var sortViewIsExpanded:Bool = false
    @State private var isViewAppear:Bool = false
    
    var action:((_ rankName:String,_ categoryName:String,_ regionName:String) -> Void)?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RankSortView(rankName: .constant("1"), categoryName:  .constant("1"), regionName:  .constant("1")) { rankName, categoryName, regionName in
        print("")
    }
}
