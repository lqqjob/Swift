//
//  CreatingViewsInALoop.swift
//  WeSplit
//
//  Created by liqiang on 2024/3/5.
//

import SwiftUI

/*
 想要在循环中创建几个SwiftUI视图是很常见的。例如，我们可能希望循环一个名称数组，并使每个名称都成为文本视图，或者循环一个菜单项数组，并将每个名称显示为图像。

 SwiftUI为此目的为我们提供了一种专用的视图类型，称为ForEach。这可以在数组和范围上循环，根据需要创建尽可能多的视图。

 ForEach将为它循环的每个项目运行一次闭包，传递当前循环项目。例如，如果我们从0循环到100，它会传递0，然后是1，然后是2，等等
 */
struct CreatingViewsInALoop: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your student",selection: $selectedStudent) {
                    ForEach(students,id: \.self) {
                        Text($0)
                    }
                }
            }
        }
    }
}

#Preview {
    CreatingViewsInALoop()
}
