//
//  WorkingWithDates.swift
//  BetterRest
//
//  Created by liqiang on 2024/3/13.
//

import SwiftUI

struct WorkingWithDates: View {
    let now = Date.now
    let tomorrow = Date.now.addingTimeInterval(86400)
    
    var body: some View {
        let range = now...tomorrow

       var components = DateComponents()
        components.hour = 8
        components.minute = 0
        let date = Calendar.current.date(from: components) ?? .now
        
        
        let components1 = Calendar.current.dateComponents([.hour,.minute,.second], from: tomorrow)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
        
        return VStack {
            Text(Date.now,format:.dateTime.hour().minute())//格式化
            Text(Date.now,format:.dateTime.hour().month().year())
            Text(Date.now.formatted(date: .long, time: .shortened))
            
        }
    }
}

#Preview {
    WorkingWithDates()
}
