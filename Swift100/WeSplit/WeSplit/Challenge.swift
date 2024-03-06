//
//  Challenge.swift
//  WeSplit
//
//  Created by liqiang on 2024/3/6.
//

import SwiftUI

struct Challenge: View {
    @State private var inputData = 0.0
    @State private var originTimeUnit = "Second"
    @State private var toTimeUnit = "Second"
    @FocusState private var forcous;
    let times = ["Second","Minute","Hour"]
    
    func power60(for count:() -> Int) -> Int {
        var result = 1;
        for _ in 0..<count() {
            result *= 60
        }
        return result
    }
    
    var result:Double {
        
        let originIndex = times.firstIndex(of: originTimeUnit) ?? 0
        let toIndex = times.firstIndex(of: toTimeUnit) ?? 0
        if originIndex == toIndex {
            return inputData
        }else if originIndex > toIndex {
            return inputData * Double(power60 {
                originIndex - toIndex
            })
        }else {
            return inputData / Double(power60 {
                toIndex - originIndex
            })
        }
        
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Input origin data") {
                    TextField("Input origin data",value: $inputData,format: .number)
                        .keyboardType(.decimalPad)
                        .focused($forcous)
                }
                Section {
                    Picker("Origin time unit",selection: $originTimeUnit) {
                        ForEach(times,id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section {
                    Picker("To time unit",selection: $toTimeUnit) {
                        ForEach(times,id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Result:") {
                    Text("\(String(format: "%.5f", result)) \(toTimeUnit)")
                }
            }
            .navigationTitle("Time unit conversion")
            .toolbar {
                if forcous {
                    Button("Done") {
                        forcous = false
                    }
                }
            }
        }
    }
}

#Preview {
    Challenge()
}
