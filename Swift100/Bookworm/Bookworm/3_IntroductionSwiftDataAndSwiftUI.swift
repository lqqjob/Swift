//
//  IntroductionSwiftDataAndSwiftUI.swift
//  Bookworm
//
//  Created by liqiang on 2024/4/1.
//

import SwiftUI
import SwiftData

@Model
class Student {
    var id:UUID
    var name:String
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}


struct IntroductionSwiftDataAndSwiftUI: View {
    @Query var students:[Student]
    @Environment(\.modelContext) var modelContext
    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
                
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                           let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]
                    let chosenFistName = firstNames.randomElement()
                    let choseLastName = lastNames.randomElement()
                    let student = Student(id: UUID(), name: "\(String(describing: chosenFistName)) \(String(describing: choseLastName))")
                    modelContext.insert(student)
                }
            }
        }
    }
        
}

#Preview {
    IntroductionSwiftDataAndSwiftUI()
}
