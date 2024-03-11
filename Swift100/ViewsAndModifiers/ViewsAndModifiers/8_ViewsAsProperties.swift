//
//  ViewsAsProperties.swift
//  ViewsAndModifiers
//
//  Created by liqiang on 2024/3/11.
//

import SwiftUI

struct ViewsAsProperties: View {
    
    let motto1 = Text("Drace,dormiens")
    let motto2 = Text("nunquam titillandus")
    
    //如果您愿意，您可以创建计算属性,这通常是将复杂视图分割成较小块的好方法，但要小心：与the body属性不同，Swift不会在这里自动应用@ViewBuilder属性，因此如果您想将多个视图发回，您有三个选项。
    var motto3:some View {
        Text("Drace,dormiens")
    }
    
    var motto4 :some View{
        VStack {
            Text("Lumos")
            Text("Obliviate")
        }
    }
    
    var motto5 : some View {
        Group {
                Text("Lumos")
                Text("Obliviate")
            }
    }
    
    @ViewBuilder var spells:some View {
        Text("Lumos")
        Text("Obliviate")
    }
    
    var body: some View {
        
        VStack {
            motto1
                .foregroundStyle(.red) //可以在使用这些属性时直接将修饰符应用于它们
            motto2
                .foregroundStyle(.blue)
            
            motto3
                .foregroundColor(.cyan)
        }
        
    }
}

#Preview {
    ViewsAsProperties()
}
