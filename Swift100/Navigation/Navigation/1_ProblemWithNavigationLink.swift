//
//  1_ProblemWithNavigationLink.swift
//  Navigation
//
//  Created by liqiang on 2024/3/25.
//

import SwiftUI

/*
 现在，当您滚动浏览时，您将看到许多DetailView实例正在创建，通常不止一次。这使得Swift和SwiftUI做的工作比必要的要多得多，因此当您处理动态数据时——例如，当您有很多不同的整数以相同的方式显示时——SwiftUI为我们提供了一个更好的解决方案：将演示值附加到我们的导航链接中。
 */

struct ProblemWithNavigationLink: View {
    var body: some View {
        NavigationStack {
            List(0..<1000) {i in
                NavigationLink("Tap me") {
                    DetailView(number: i)
                }
                
            }
        }
    }
}


struct DetailView:View {
    var number:Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("Creating detail view \(number)")
    }
}

#Preview {
    ProblemWithNavigationLink()
}
