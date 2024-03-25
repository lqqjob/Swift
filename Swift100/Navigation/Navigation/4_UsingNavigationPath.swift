//
//  UsingNavigationPath.swift
//  Navigation
//
//  Created by liqiang on 2024/3/25.
//

import SwiftUI

struct UsingNavigationPath: View {
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                NavigationLink("Select Number:\(i)",value: i)
                }
                ForEach(0..<5) {i in
                    NavigationLink("Select String:\(i)",value: String(i))
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You select the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You select the string \(selection)")
            }
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }
                
                Button("Push Hello") {
                    path.append("Hello1")
                    path.append("Hello2")
                }
            }
        }
        
      
    }
}

#Preview {
    UsingNavigationPath()
}
