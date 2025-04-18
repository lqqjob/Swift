//
//  ScrollViewOffsetPreferenceKeyBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 4/18/25.
//

import SwiftUI

struct ScrollViewOffsetPreference:  PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    func onScrollViewOffsetChanged(action:@escaping (_ offset:CGFloat) -> Void) -> some View {
        self.background(
            GeometryReader(content: { geo in
                Text("")
                    .preference(key: ScrollViewOffsetPreference.self, value: geo.frame(in: .global).minY)
            })
        )
        .onPreferenceChange(ScrollViewOffsetPreference.self) { value in
            action(value)
        }
    }
}

struct ScrollViewOffsetPreferenceKeyBootcamp: View {
    private let  title:String = "New title here!!!"
    @State private var scrollViewOffset:CGFloat = 0
    var body: some View {
        ScrollView {
            VStack {
                titleLayer
                    .opacity(Double(scrollViewOffset) / 63.0)
                    .onScrollViewOffsetChanged { offset in
                        self.scrollViewOffset = offset
                    }
                contentLayer
            }
            .padding()
        }
        .overlay(content: {
            Text("\(scrollViewOffset)")
        })
        .overlay(alignment: .top) {
            navBarlayer.opacity(scrollViewOffset < 40 ? 1.0 :0)
        }
    }
}


extension ScrollViewOffsetPreferenceKeyBootcamp  {
    private var titleLayer:some View {
        Text(title)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    private var contentLayer:some View {
        ForEach(0..<30) {_ in
            RoundedRectangle(cornerRadius: 30)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300,height: 200)
                
        }
    }
    
    private var navBarlayer:some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity)
            .frame(height: 55)
            .background(Color.blue)
    }
}

#Preview {
    ScrollViewOffsetPreferenceKeyBootcamp()
}
