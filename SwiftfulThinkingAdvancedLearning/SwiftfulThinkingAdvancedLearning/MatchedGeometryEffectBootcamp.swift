//
//  MatchedGeometryEffectBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 4/16/25.
//

import SwiftUI

struct MatchedGeometryEffectBootcamp: View {
    @State  private var selected:String = "Home"
    let categories:[String] = ["Home","Popular","Saved"]
    @Namespace private var namespace2
    var body: some View {
        HStack {
            ForEach(categories,id: \.self) { category in
                ZStack (alignment: .bottom) {
                    if selected == category {
                           Text(category)
                               .font(.headline)
                               .foregroundStyle(selected == category ? .red : .black)
                               .background( // 把 background 放到 Text 上
                                   RoundedRectangle(cornerRadius: 10)
                                       .fill(Color.red)
                                       .matchedGeometryEffect(id: "category_background", in: namespace2)
                                       .frame(height: 2)
                                       .offset(y:18) // 适配位置
                               )
                    }else {
                        Text(category)
                            .font(.headline)
                    }
                   
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = category
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    MatchedGeometryEffectBootcamp()
}
