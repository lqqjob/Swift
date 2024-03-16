//
//  IntroducingList.swift
//  WordScramble
//
//  Created by liqiang on 2024/3/16.
//

import SwiftUI
/// Form和List的最大的区别是List可以完全的动态，而不需要和ForEach结合
struct IntroducingList: View {
    var body: some View {
        List{
            Section("Section 1") {
                Text("Static row 1")
                Text("Static row 2")
            }
            .textCase(nil)
           
            
            Section("Section 2") {
                ForEach(0..<5) {
                    Text("Dynamic row \($0)")
                    
                }
            }
            .textCase(nil)
            
            Section("Section 3") {
                Text("Static row 3")
                Text("Static row 4")
            }
            .textCase(nil)
        }
        .listStyle(.grouped)
        
    }
}

struct IntroducingList2 : View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
    var body: some View {
        List(people,id: \.self) {
            Text($0)
        }
    }
}

#Preview {
    IntroducingList2()
}
