//
//  ContentView.swift
//  WeSplit
//
//  Created by liqiang on 2024/3/5.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeopleIndex = 2
    @State private var tipPercentage = 20
    let tipPercentages = [10,15,20,25,0]
    
    var mountTotal:Double {
        let tipSection = Double(tipPercentage)
        
        let tipValue = checkAmount/100 * tipSection
        let grandTotal = checkAmount + tipValue
        return grandTotal
    }
    
    var totalPerPerson:Double {
        let peopleCount = Double(numberOfPeopleIndex + 2)
        let amountPerson = mountTotal / peopleCount
        
        return amountPerson
    }
    
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {// body计算属性
        NavigationStack {
            Form {
                
                /// 1、使用TextField从用户那里阅读文本
                
                Section {
                    TextField("Amount",value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                /// 2、 在表单中创建选择器
                    
                    Picker("Number of people",selection: $numberOfPeopleIndex) {
                        ForEach(2..<100) { number in
                        Text("\(number) people")
                        }
                    }
                    .pickerStyle(.navigationLink)//设置显示样式
                }
                /// 3、为小费百分比添加分段控件
                Section("How much tip do you want to leave?") {//SwiftUI允许我们向Section的页眉和页脚添加视图
                    Picker("Tip percentage",selection: $tipPercentage) {
                        ForEach(tipPercentages,id:\.self) {
                            Text($0,format:.percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                /// 4、 计算每人总数
                
                Section("Amount per person") {
                    Text(totalPerPerson,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Amount Total") {
                    Text(mountTotal,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .foregroundColor(tipPercentage==0 ? .red : .blue)
                }
                
            }
            .navigationTitle("WeSplit") //人们很容易认为修饰符应该附加到NavigationStack的末尾，但它需要附加到Form的末尾。原因是导航堆栈能够在程序运行时显示许多视图，因此通过将标题附加到导航堆栈内的东西上，我们允许iOS自由更改标题。
            
            
            /// 5、 隐藏键盘

            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
            
        }
    }
}

#Preview {
    ContentView()
}
