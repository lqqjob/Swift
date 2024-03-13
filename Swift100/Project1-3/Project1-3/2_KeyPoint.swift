//
//  KeyPoint.swift
//  Project1-3
//
//  Created by liqiang on 2024/3/12.
//

import SwiftUI

struct KeyPoint: View {
    
    /// 1、结构与类
    
    /*
     如果你还记得，结构和类之间有五个关键区别：

     类不带成员初始化器；结构默认获取这些。
     类可以使用继承来构建功能；结构不能。
     如果您复制一个类，两个副本指向相同的数据；结构的副本总是唯一的。
     类可以有去初始化器；结构不能。
     您可以在常量类内更改变量属性；常量结构中的属性是固定的，无论属性是常量还是变量。
     */
    
    
    @State private var selection = 0
    
    
    
    @State private var agreedToTerms = false
        @State private var agreedToPrivacyPolicy = false
        @State private var agreedToEmails = false

    var body: some View {
        
        /// 2、与ForEach合作
        
        ForEach(0..<2) { number in
            Text("Row \(number)")
        }
        //ForEach是一个视图，就像SwiftUI中的大多数其他东西一样，但它允许我们在循环中创建其他视图。
        let agents = ["Cyril", "Lana", "Pam", "Sterling"]
        VStack {
            ForEach(0..<agents.count) {
                Text(agents[$0])
            }
        }
        //优化为：
        VStack {
            ForEach(agents,id: \.self) {
                Text($0)
            }
        }
        
        /// 3、处理绑定
        
        let binding = Binding(
            get:{selection},
            set:{selection = $0}
        )
        
        VStack {
            Picker("Select a number",selection: binding) {//请注意，选择器现在使用selection: binding-不需要美元符号
                ForEach(0..<3) {
                    Text("Item \($0)")
                }
            }
            .pickerStyle(.segmented)
        }
        
        let agreedToAll = Binding<Bool> {
            agreedToTerms && agreedToEmails && agreedToPrivacyPolicy
        } set: {
            agreedToTerms = $0
            agreedToEmails = $0
            agreedToPrivacyPolicy = $0
        }

        VStack{
            Toggle("terms",isOn: $agreedToTerms)
            Toggle("policy",isOn: $agreedToPrivacyPolicy)
            Toggle("email",isOn: $agreedToEmails)
            Toggle("all",isOn: agreedToAll)
        }
        
    }
}

#Preview {
    KeyPoint()
}
