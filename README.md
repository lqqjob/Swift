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

重要注意事项：
	•	类型支持：` @AppStorage` 支持常见的简单类型，例如 `String`、`Int`、`Bool`、`Double` 等。
	•	默认值： 必须提供一个默认值，这个值会在 `UserDefaults` 中没有相应键时使用。
	•	同步更新： 一旦 `@AppStorage` 绑定的值变化，界面会自动更新，并且新的值会保存到 `UserDefaults`。

总结：

`@AppStorage` 是 `SwiftUI` 提供的一种简便方式，用于在 `UserDefaults` 中存取数据，并且与视图进行自动绑定，简化了开发过程中的持久化存储和 UI 更新逻辑。