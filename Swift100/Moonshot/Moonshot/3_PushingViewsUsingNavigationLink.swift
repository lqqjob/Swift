//
//  3_PushingViewsUsingNavigationLink.swift
//  Moonshot
//
//  Created by liqiang on 2024/3/23.
//

import SwiftUI

struct PushingViewsUsingNavigationLink: View {
    var body: some View {
//        NavigationStack {
//            NavigationLink {
//                Text("Detail View")
//            } label: {
//                VStack {
//                    Text("This is the label")
//                    Text("So is this")
//                    Image(systemName: "face.smiling")
//                }
//            }
//            .navigationTitle("SwiftUI")
//        }
        
        NavigationStack {
            List(0..<100) { row in
                NavigationLink ("Row \(row)") {
                    Text("Detail \(row)")
                }
                
            }
        }
    }
}

#Preview {
    PushingViewsUsingNavigationLink()
}
