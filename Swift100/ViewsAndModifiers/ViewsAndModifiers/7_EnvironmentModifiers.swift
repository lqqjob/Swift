//
//  EnvironmentModifiers.swift
//  ViewsAndModifiers
//
//  Created by liqiang on 2024/3/11.
//

import SwiftUI

struct EnvironmentModifiers: View {
    var body: some View {
        VStack {
            Text("Gryffindor")
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title) // 这被称为环境修饰符，与应用于视图的常规修饰符不同。
        
        VStack {
            Text("Gryffindor")
                .font(.largeTitle) //子视图中的任何一个覆盖了相同的修饰符，则子视图将优先。
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        
        
        VStack {
            Text("Gryffindor")
                .blur(radius: 0)
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .blur(radius: 5) //blur()是一个常规修饰符，因此应用于子视图的任何模糊都会添加到VStack模糊中，而不是替换它
    }
}

#Preview {
    EnvironmentModifiers()
}
