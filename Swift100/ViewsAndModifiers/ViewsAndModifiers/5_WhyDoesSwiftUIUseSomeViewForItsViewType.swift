//
//  WhyDoesSwiftUIUseSomeViewForItsViewType.swift
//  ViewsAndModifiers
//
//  Created by liqiang on 2024/3/11.
//

import SwiftUI

/*
 有两个地方它变得更复杂了：

 VStack是如何工作的——它符合View协议，但它如何填充“它有什么样的内容？”洞，如果里面能包含很多不同的东西？
 如果我们直接从body属性发回两个视图，而不将它们包裹在堆栈中，会发生什么？
 首先回答第一个问题，如果您创建一个内部有两个文本视图的VStack，SwiftUI会默默地创建一个TupleView来包含这两个视图——一种特殊类型的视图，里面恰好包含两个视图。因此，VStack填补了“这是什么视图？”答案是“这是一个包含两个文本视图的TupleView”。

 如果您在VStack中有三个文本视图呢？然后是包含三个视图的TupleView。或者四个观点。或者八个视图，甚至十个视图——TupleView只是不断扩展。

 至于第二个问题，Swift默默地将一个特殊属性应用于名为@ViewBuilder的body属性。这具有在其中一个TupleView容器中静默包装多个视图的效果，因此，即使我们看起来像是发送了多个视图，它们也会合并成一个TupleView。
 
 这种行为不是魔法：如果您右键单击“View协议并选择“跳转到定义”，您将看到对body属性的要求，并看到它标记了@ViewBuilder属性：
 @ViewBuilder @MainActor var body: Self.Body { get }
 
 */

struct WhyDoesSwiftUIUseSomeViewForItsViewType: View {
    var body: Text {//也是可以的
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WhyDoesSwiftUIUseSomeViewForItsViewType()
}
