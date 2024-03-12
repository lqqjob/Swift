//
//  WhatYouLearned.swift
//  Project1-3
//
//  Created by liqiang on 2024/3/12.
//

import SwiftUI

/*
 
 到目前为止，我们已经涵盖了：

 1、构建将文本与Picker等控件混合的滚动表单，SwiftUI将其变成一个漂亮的基于表格的布局，新屏幕以新的选择滑入。
 2、创建一个NavigationStack并给它一个标题。这不仅允许我们将新视图推送到屏幕上，还允许我们设置标题，并避免内容在时钟下出现问题。
 3、如何使用@State存储不断变化的数据，以及为什么需要它。请记住，我们所有的SwiftUI视图都是结构，这意味着如果没有像@State这样的东西，它们就无法更改。
 4、为TextField和Picker等用户界面控件创建双向绑定，学习如何使用$variable让我们既读取又写入值。
 5、使用ForEach在循环中创建视图，这允许我们一次创建许多视图。
 6、使用VStack、HStack和ZStack构建复杂的布局，以及将它们组合在一起以制作网格。
 7、如何使用颜色和渐变作为视图，包括如何为它们提供特定的框架，以便您可以控制它们的大小。
 8、如何通过提供一些文本或图像来创建按钮，以及点击按钮时应执行的闭包。
 9、通过定义应显示警报的条件来创建警报，然后从其他地方切换该状态。
 10、如何（以及为什么！）SwiftUI如此广泛地使用不透明的结果类型（some View），以及为什么这与修饰符顺序如此密切相关。
 11、如何使用三元条件运算符创建条件修饰符，根据您的程序状态应用不同的结果。
 12、如何使用视图组合和自定义视图修饰符将代码分解成小部分，这反过来又使我们能够构建更复杂的程序，而不会迷失在代码中。

 */


struct WhatYouLearned: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    WhatYouLearned()
}
