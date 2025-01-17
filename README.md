# Swift
学习网站
1. https://www.avanderlee.com/swift
2. https://www.hackingwithswift.com/100/swiftui
3. https://github.com/37MobileTeam/iAppStore-SwiftUI

## 一、属性包装器
### 1. AppStorage

`@AppStorage`：是 `SwiftUI` 中一个非常方便的属性包装器，用来在应用的用户默认设置中存储和读取数据。它允许你将数据直接与用户的默认设置 (`UserDefaults`) 绑定，并且当数据发生变化时，视图会自动更新。

**主要功能：**
	1. 自动存储与读取： `@AppStorage` 会将数据存储到 `UserDefaults` 中，并在属性值发生变化时自动保存，而无需显式调用 `UserDefaults API`。
	2. 与视图自动绑定： 使用 `@AppStorage` 修饰的属性可以自动与 UI 绑定，当属性值发生变化时，UI 会自动更新。
	3. 简化存取数据： 不需要自己管理 `UserDefaults` 的代码，减少了重复的存取逻辑。
	
使用示例：	
	
```
import SwiftUI

struct ContentView: View {
    @AppStorage("username") private var username: String = "Guest"

    var body: some View {
        VStack {
            Text("Hello, \(username)!")
            
            Button("Change Username") {
                username = "Alice"
            }
        }
    }
}
```
解释：
	•	在这个例子中，`@AppStorage("username")` 将 `username` 属性绑定到用户的默认设置中，键为 `"username"`。
	•	初始值 `"Guest"` 会在没有找到对应的 `UserDefaults` 值时使用。
	•	当按钮被点击时，`username` 的值会改变，并且自动更新 UI，同时新值会存储到 `UserDefaults` 中。

-------

重要注意事项：
	•	类型支持：` @AppStorage` 支持常见的简单类型，例如 `String`、`Int`、`Bool`、`Double` 等。
	•	默认值： 必须提供一个默认值，这个值会在 `UserDefaults` 中没有相应键时使用。
	•	同步更新： 一旦 `@AppStorage` 绑定的值变化，界面会自动更新，并且新的值会保存到 `UserDefaults`。

总结：

`@AppStorage` 是 `SwiftUI` 提供的一种简便方式，用于在 `UserDefaults` 中存取数据，并且与视图进行自动绑定，简化了开发过程中的持久化存储和 UI 更新逻辑。

### 2. @Published
`@Published `是 Swift 中一个用于声明属性的属性包装器，通常与 `ObservableObject` 协议一起使用。它的作用是标记一个属性为可观察的，使得这个属性的变化能够被自动通知给观察者，通常是视图。

**主要功能：**
* 	自动通知视图更新： 当一个 `@Published` 修饰的属性值发生变化时，系统会自动发送通知，告知所有绑定到该属性的视图进行更新，从而使得 UI 与数据模型保持同步。
* 	与 `ObservableObject` 协议一起使用： 通常，`@Published` 修饰的属性是在一个遵循 `ObservableObject` 协议的类中使用的，这样可以让其他视图或对象订阅该类的属性变化。

示例代码：

```
import SwiftUI

class MyViewModel: ObservableObject {
    @Published var name: String = "Alice"
}

struct ContentView: View {
    @ObservedObject var viewModel = MyViewModel()

    var body: some View {
        VStack {
            Text(viewModel.name)
            Button("Change Name") {
                viewModel.name = "Bob"
            }
        }
    }
}
```
在这个例子中，`MyViewModel` 类中的 name 属性被 `@Published` 修饰。每当 `name` 发生变化时，视图（`ContentView`）会自动更新显示新的值。

-------

**总结：**
* 	`@Published` 修饰的属性会在值变化时自动通知其观察者。
* 	结合 `ObservableObject` 使用时，可以使数据的变化驱动界面的更新。

### 3. @ObservedObject
`@ObservedObject` 是 `SwiftUI` 中用于绑定和观察外部可观察对象（`observable object`）的一种属性包装器。它允许 `SwiftUI` 视图订阅并响应外部对象的变化，从而自动更新视图。

**作用**
* 监听数据变化：当被标记为 `@ObservedObject` 的对象中的属性发生变化时，SwiftUI 会自动刷新绑定到该对象的视图。
* 管理外部对象的状态：`@ObservedObject` 通常用于将数据模型（遵守 `ObservableObject` 协议的类）注入到视图中，而不直接管理数据。

-------

**基本用法**
	a. 数据模型定义
	数据模型需要遵守 `ObservableObject` 协议，并使用 `@Published` 修饰需要被观察的属性：
	
```
import SwiftUI

class UserData: ObservableObject {
    @Published var username: String = "Guest"
}
```
    
b. 使用 `@ObservedObject` 绑定到视图
在视图中声明一个 `@ObservedObject`，绑定到模型实例：

```
struct ContentView: View {
    @ObservedObject var userData = UserData()
    
    var body: some View {
        VStack {
            Text("Username: \(userData.username)")
            Button("Change Username") {
                userData.username = "SwiftUser"
            }
        }
    }
}
```

-------

**与其他属性包装器的对比**

`@StateObject`
* 	用途：用来在视图中创建和持有一个 `ObservableObject` 的实例。
* 	适用场景：用于父视图创建和管理对象的生命周期。

`@ObservedObject`
* 	用途：用来观察传入的对象，而不负责创建或管理对象的生命周期。
* 适用场景：用于子视图中接收父视图传递的 ObservableObject。

`@EnvironmentObject`
* 	用途：用来观察环境中共享的 `ObservableObject`。
* 	适用场景：适合在多个视图中共享统一的状态。

-------

**注意事项**

生命周期管理：
 	•	`@ObservedObject` 不负责管理对象的生命周期。
	•	确保被观察对象在视图生命周期内有效，否则会导致崩溃。
	
避免重复创建：
	•	如果在多个地方实例化 `@ObservedObject`，将导致状态不同步。
	•	推荐在父视图中创建对象，并通过参数传递给子视图。

-------

**完整示例：父子视图数据传递**


```
import SwiftUI

class Counter: ObservableObject {
    @Published var value: Int = 0
}

struct ParentView: View {
    @StateObject private var counter = Counter()
    
    var body: some View {
        ChildView(counter: counter)
    }
}

struct ChildView: View {
    @ObservedObject var counter: Counter
    
    var body: some View {
        VStack {
            Text("Count: \(counter.value)")
            Button("Increment") {
                counter.value += 1
            }
        }
    }
}
```
运行效果：
* 	父视图 `ParentView` 创建并持有 `Counter` 对象。
* 	子视图 `ChildView` 使用 `@ObservedObject` 接收 `Counter`，并能够更新和响应数据变化。

-------
**总结**
* 	`@ObservedObject` 是用于从外部接收并观察一个 `ObservableObject` 的状态。
* 	它是 `SwiftUI` 的关键机制之一，支持视图和数据模型之间的解耦与动态更新。
* 	常用于子视图绑定父视图或其他外部传入的对象。