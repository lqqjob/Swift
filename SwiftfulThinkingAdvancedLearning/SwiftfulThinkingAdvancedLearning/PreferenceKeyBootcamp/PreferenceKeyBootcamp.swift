//
//  PerferenceKeyBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 4/17/25.
//

import SwiftUI

struct PreferenceKeyBootcamp: View {
    @State private var title = "Hello world"
    var body: some View {
        NavigationView {
            SecondPage(text: title)
                .navigationTitle("Navigation Title")
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self) { value in
            self.title = value
        }
    }
}

struct SecondPage:View {
    let text:String;
    @State private var newValue:String = ""
    
    var body: some View {
        Text(text)
            .onAppear {
                loadDataFromDatabase()
            }
            .preference(key: CustomTitlePreferenceKey.self, value: newValue)
            
    }
    
    func loadDataFromDatabase() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.newValue = "NEW VALUE FROM DATABASE"
        }
    }
}
struct CustomTitlePreferenceKey:PreferenceKey {
    static var defaultValue: String = ""
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
    
    
}
#Preview {
    PreferenceKeyBootcamp()
}
