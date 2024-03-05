//
//  BindingStateToUserInterfaceControls.swift
//  WeSplit
//
//  Created by liqiang on 2024/3/5.
//

import SwiftUI

struct BindingStateToUserInterfaceControls: View {
   @State private var name = ""
    var body: some View {
        Form{
            TextField("Enter your name",text: $name) //$ 双向绑定,读取和写入的
            Text("Your name is \(name)") //这里不需要双向绑定，因为只是获取，并没有写
        }
    }
}

#Preview {
    BindingStateToUserInterfaceControls()
}
