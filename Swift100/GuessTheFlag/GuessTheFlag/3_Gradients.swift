//
//  Gradients.swift
//  GuessTheFlag
//
//  Created by liqiang on 2024/3/8.
//

import SwiftUI
/*
 渐变由几个组件组成：

 要显示的一系列颜色
 尺寸和方向信息
 要使用的梯度类型
 */
struct Gradients: View {
    var body: some View {
        
    /// 1、线性梯度朝一个方向发展，因此我们为它提供了像这样的起点和终点
        
        LinearGradient(colors: [.white,.black], startPoint: .top, endPoint: .bottom)//线性渐变向一个方向发展，因此我们为它提供了像这样的起点和终点
            .ignoresSafeArea()
        LinearGradient(stops: [Gradient.Stop(color: .white, location: 0.45),Gradient.Stop(color: .black, location: 0.55)], startPoint: .top, endPoint: .bottom) // 我们可以指定，我们的梯度从启动到可用空间的45%应该是白色，然后从可用空间的55%开始是黑色的
            .ignoresSafeArea()
//        LinearGradient(stops: [.init(color: .white, location: 0.45),.init(color: .black, location: 0.55)], startPoint: .top, endPoint: .bottom) Swift知道我们在这里创建渐变停止，所以作为快捷方式，我们可以只写.init而不是Gradient.Stop
        
        
    ///2、径向梯度以圆形向外移动，因此我们不指定方向，而是指定开始和结束半径——颜色应该开始和停止变化，离圆的中心有多远
        RadialGradient(colors: [Color.blue,.black], center: .center, startRadius: 20, endRadius: 200)
        
        
    ///3、最后一个梯度也是一种视图，被称为角梯度，尽管您可能在其他地方听说过它被称为圆锥形或圆锥形梯度。这会围绕一个圆圈循环颜色，而不是向外辐射，并且可以创造一些美丽的效果。
        AngularGradient(colors: [.red,.yellow,.green,.blue,.purple,.red], center: .center)
        
        
    ///4、SwiftUI提供了第四种类型的渐变，比前三种更简单——您无法控制它，您也可以只将它们用作背景和前景样式，而不是单个视图。此渐变是通过在任何颜色后添加.gradient创建的——SwiftUI将自动将您的颜色转换为非常柔和的线性渐变
        Text("content")
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            .foregroundStyle(.white)
            .background(.red.gradient)
    }
}

#Preview {
    Gradients()
}
