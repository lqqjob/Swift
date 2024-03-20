//
//  UsingStateWithClasses.swift
//  iExpense
//
//  Created by liqiang on 2024/3/20.
//

import SwiftUI
import Observation

/*
 之前我们研究了类和结构之间的差异，我提到了两个重要的差异。首先，该结构总是有唯一的所有者，而对于类，多个东西可以指向相同的值。其次，该类在更改其属性的方法之前不需要mutating关键字，因为您可以更改常量类的属性。

 在实践中，这意味着如果我们有两个SwiftUI视图，并且我们向它们发送相同的结构来工作，它们实际上每个都有该结构的唯一副本；如果一个更改它，另一个将看不到该更改。另一方面，如果我们创建一个类的实例并将其发送到两个视图，他们将共享更改。

 对于SwiftUI开发人员来说，这意味着如果我们想在多个视图之间共享数据——如果我们想让两个或多个视图指向相同的数据，以便当一个更改时，他们都会得到这些更改——我们需要使用类而不是结构。

 因此，请将User结构更改为类。由此：
 */


//与@Observable共享SwiftUI状态
@Observable
class User{
    var firstName = "Bilo"
    var lasteName = "Baggins"
}

struct UsingStateWithClasses: View {
    @State private var user = User()
    var body: some View {
        VStack {
            Text("Your name is \(user.firstName) \(user.lasteName)")
            TextField("First name",text: $user.firstName)
            TextField("Last name", text: $user.lasteName)
        }
    }
}

#Preview {
    UsingStateWithClasses()
}
