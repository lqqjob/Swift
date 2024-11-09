//
//  1_AlignmentAndAlignmentGuides.swift
//  LayoutAndGeometry
//
//  Created by liqiang on 2024/11/9.
//

import SwiftUI

struct AlignmentAndAlignmentGuides: View {
    var body: some View {
        Text("Live long and prosper")
            .frame(width: 300,height: 300,alignment: .topLeading)
        HStack(alignment: .lastTextBaseline) {
            Text("Live")
                .font(.caption)
            Text("Long")
            Text("and")
            Text("prosper")
                .font(.largeTitle)
        }
        VStack(alignment: .leading) {
            Text("Hello,World")
                .alignmentGuide(.leading) { d in d[.leading]
                
                }
            Text("This is a longer line of text")
        }
        .background(.red)
        .frame(width: 400,height: 400)
        .background(.blue)
    }
}

#Preview {
    AlignmentAndAlignmentGuides()
}
