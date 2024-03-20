//
//  BuildingCustomTransitionsUsingViewModifier.swift
//  Animation
//
//  Created by liqiang on 2024/3/20.
//

import SwiftUI


struct CornerRotateModifyer: ViewModifier {
    
    let anount:Double
    let anchor:UnitPoint
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(anount),anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifyer(anount: -90, anchor: .topLeading), identity: CornerRotateModifyer(anount: 0, anchor: .topLeading))
    }
}

struct BuildingCustomTransitionsUsingViewModifier: View {
    @State private var isShowingRed = false
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width:200,height: 200)
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width:200,height: 200)
                    .transition(.pivot)
            }
            
        }
        .onTapGesture {
            withAnimation {
                isShowingRed.toggle()
            }
        }
    }
}

#Preview {
    BuildingCustomTransitionsUsingViewModifier()
}
