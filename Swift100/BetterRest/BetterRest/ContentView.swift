//
//  ContentView.swift
//  BetterRest
//
//  Created by liqiang on 2024/3/13.
//

import SwiftUI
import CoreML
struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
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
                VStack(alignment:.leading) {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    DatePicker("Please enter a time",selection: $wakeUp,displayedComponents: [.hourAndMinute])
                        .labelsHidden()
                }
                VStack(alignment: .leading, content: {
                    Text("Desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hours",value: $sleepAmount,in: 4...12,step: 0.25)
                })
                VStack(alignment: .leading, content: {
                    Text("Daily coffee intake")
                        .font(.headline)
//                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cup(s)",value: $coffeeAmount,in: 1...20,step: 1)
                    Stepper("^[\(coffeeAmount) cup](inflect:true)",value: $coffeeAmount,in: 1...20,step: 1)
                })
                .alert(alertTitle, isPresented: $showingAlert) {
                    Button("OK") {
                            
                    }
                } message: {
                    Text(alertMessage)
                }

            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate",action: calculateBedtime)
            }
        }
        
    }
    
    /// 将SwiftUI连接到Core ML
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let comonents = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
            let hour = (comonents.hour ?? 0) * 60 * 60
            let minute = (comonents.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep:sleepAmount , coffee: Double(coffeeAmount))
            
            let sleepTime = wakeUp-prediction.actualSleep //您可以直接从Date中以秒为单位减去一个值，然后您将获得一个新的Date
            
            alertTitle = "Your ideal bedtime is…"
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            showingAlert = true
            
        } catch {
            
        }
    }
}

#Preview {
    ContentView()
}
