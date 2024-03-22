//
//  ScrollViewWork.swift
//  Moonshot
//
//  Created by liqiang on 2024/3/22.
//

import SwiftUI


struct CustomText:View {
    let text:String
    var body: some View {
        Text(text)
    }
    init(_ text:String) {
        print("Creating a new CustomText")
        self.text = text;
    }
}

struct ScrollViewWork: View {
    var body: some View {
        ScrollView {
           LazyVStack(spacing:100) {
                ForEach(0..<100) {
                    CustomText("Item \($0)")
                        .font(.title)
                }
            }        
            .frame(maxWidth: .infinity)

        }
    }
}

#Preview {
    ScrollViewWork()
}
