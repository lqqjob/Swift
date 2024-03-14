//
//  Challenge.swift
//  BetterRest
//
//  Created by liqiang on 2024/3/14.
//

import SwiftUI
import CoreML
struct Challenge: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    var alertMessage:String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let comonents = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (comonents.hour ?? 0) * 60 * 60
            let minute = (comonents.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep:sleepAmount , coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp-prediction.actualSleep //您可以直接从Date中以秒为单位减去一个值，然后您将获得一个新的Date
            
            alertTitle = "Your ideal bedtime is…"
            return sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
           return "Error"
        }
        
    }
    @State private var showingAlert = false
    
    
    /// 我们可以将defaultWakeTime为静态变量，这意味着它属于ContentView结构本身，而不是该结构的单个实例。这反过来意味着defaultWakeTime可以随时读取，因为它不依赖于任何其他属性的存在
  static  var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time",selection: $wakeUp,displayedComponents: [.hourAndMinute])
                        .labelsHidden()
                }
                .font(.headline)
                .foregroundColor(.black)
                .textCase(nil)
                
                
                Section("Desired amount of sleep") {
            
                    Stepper("\(sleepAmount.formatted()) hours",value: $sleepAmount,in: 4...12,step: 0.25)
                }
                .font(.headline)
                .foregroundColor(.black)
                .textCase(nil)
                
                Section("Daily coffee intake") {
                    
//                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cup(s)",value: $coffeeAmount,in: 1...20,step: 1)
//                    Stepper("^[\(coffeeAmount) cup](inflect:true)",value: $coffeeAmount,in: 1...20,step: 1)
                    Picker("^[\(coffeeAmount+1) cup](inflect:true)",selection: $coffeeAmount) {
                        ForEach (1..<21) {number in
                            Text("\(number)")
                            
                        }
                    }
                }
                .font(.headline)
                .foregroundColor(.black)
                .textCase(nil)
                Section("Your ideal bedtime is") {
                    Text("\(alertMessage)")

                }
                .font(.headline)
                .foregroundColor(.black)
                .textCase(nil)

            }
            .navigationTitle("BetterRest")
           
        }
        
    }
    

}

#Preview {
    Challenge()
}
