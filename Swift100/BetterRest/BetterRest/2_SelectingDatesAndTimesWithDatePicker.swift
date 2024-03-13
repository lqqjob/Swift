//
//  SelectingDatesAndTimesWithDatePicker.swift
//  BetterRest
//
//  Created by liqiang on 2024/3/13.
//

import SwiftUI

struct SelectingDatesAndTimesWithDatePicker: View {
    @State private var wakeUp = Date.now
    var body: some View {
       DatePicker("Please enter a date",selection: $wakeUp)
        DatePicker("",selection: $wakeUp)
        DatePicker("Please enter a date",selection: $wakeUp)
            .labelsHidden() //隐藏标签
        DatePicker("Please enter a date",selection: $wakeUp,displayedComponents: .hourAndMinute)
            .labelsHidden() //隐藏标签
        
        DatePicker("Please enter a date",selection: $wakeUp,in: Date.now...,displayedComponents: [.date,.hourAndMinute])
            .foregroundColor(.white)
            .labelsHidden() //显示范围
            .font(.largeTitle)
            .background(.red)
        
    }
}

#Preview {
    SelectingDatesAndTimesWithDatePicker()
}
