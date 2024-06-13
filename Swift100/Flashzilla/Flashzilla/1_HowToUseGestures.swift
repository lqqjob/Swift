//
//  HowToUseGestures.swift
//  Flashzilla
//
//  Created by liqiang on 2024/6/13.
//

import SwiftUI

struct HowToUseGestures: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0
    
    @State private var currentAngle = Angle.zero
    @State private var finalAngle = Angle.zero
    
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
   
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
               
            }
            
        let combined = pressGesture.sequenced(before: dragGesture)
        Text("Hello, World!")
            .onTapGesture(count:2) {
                print("Double tapped")
            }
            .onLongPressGesture(minimumDuration: 2) {
                print("Long pressed!")
            } onPressingChanged: { inProgress in
                print("In progress:\(inProgress)")
            }
        Text("Hello,World!")
            .scaleEffect(finalAmount + currentAmount)
            .rotationEffect(finalAngle + currentAngle)
            .gesture(
                MagnifyGesture()
                    .onChanged({ value in
                        currentAmount = value.magnification - 1
                    })
                    .onEnded({ value in
                        finalAmount += currentAmount
                        currentAmount = 0
                    })
            )
            .gesture(
            RotateGesture()
                .onChanged({ value in
                    currentAngle = value.rotation
                })
                .onEnded({ value in
                    finalAngle += currentAngle
                    currentAngle = .zero
                })
            )
        Text("Hello,world")
            .rotationEffect(finalAngle + currentAngle)
            .gesture(
            RotateGesture()
                .onChanged({ value in
                    currentAngle = value.rotation
                })
                .onEnded({ value in
                    finalAngle += currentAngle
                    currentAngle = .zero
                })
            )
        
        VStack{//优先响应 子视图的手势
            Text("Hello,World!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .onTapGesture {
            print("VStack tapped")

        }
        
        VStack{
            Text("Hello,World!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .highPriorityGesture(//强制触发父级的手势
            TapGesture()
                .onEnded {
                    print("VStack tapped")
                }
        )
        
        VStack{
            Text("Hello,World!")
                .onTapGesture {
                    print("Text tapped")
                }
        }
        .simultaneousGesture(//父手势和子手势同时触发
            TapGesture()
                .onEnded {
                    print("VStack tapped")
                }
        )
        
        Circle()
            .fill(.red)
            .frame(width:64,height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

#Preview {
    HowToUseGestures()
}
