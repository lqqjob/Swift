//
//  CustomTabBarView.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by liqiang on 4/21/25.
//

import SwiftUI

struct CustomTabBarView: View {
    let tabs:[TabBarItem]
    @Binding var selection:TabBarItem
    @State var localSelection:TabBarItem
    @Namespace private var tabNameSpace
    var body: some View {
        tabBarVersionView2
            .onChange(of: selection) { oldValue, newValue in
                withAnimation(.easeInOut) {
                    localSelection = newValue
                }
            }
    }
}
extension CustomTabBarView {
    private  func tabView(item:TabBarItem) -> some View {
        VStack {
            Image(systemName: item.iconName)
                .font(.subheadline)
            Text(item.title)
                .font(.system(size: 10,weight: .semibold,design: .rounded))
        }
        .foregroundStyle(localSelection == item ? item.color : Color.gray)
        .padding(.vertical,8)
        .frame(maxWidth: .infinity)
        .background(localSelection == item ? item.color.opacity(0.2): Color.clear)
        .cornerRadius(10)
    }
    private var tabBarVersionView1:some View {
        HStack {
            ForEach(tabs,id: \.self) { item in
                tabView(item: item)
                    .onTapGesture {
                        switchToTab(tab: item)
                    }
                
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
    func switchToTab(tab:TabBarItem) {
            selection = tab
        
    }
}
extension CustomTabBarView {
    private  func tabView2(item:TabBarItem) -> some View {
        VStack {
            Image(systemName: item.iconName)
                .font(.subheadline)
            Text(item.title)
                .font(.system(size: 10,weight: .semibold,design: .rounded))
        }
        .foregroundStyle(selection == item ? item.color : Color.gray)
        .padding(.vertical,8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if localSelection == item {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(item.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_retangle", in: tabNameSpace)
                    
                }
            }
        )
    }
    private var tabBarVersionView2:some View {
        HStack {
            ForEach(tabs,id: \.self) { item in
                tabView2(item: item)
                    .onTapGesture {
                        switchToTab(tab: item)
                    }
                
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10,x: 0,y: 5)
        .padding(.horizontal)
    }
}
#Preview {
    let tabs :[TabBarItem] = [
        .home,.favorites,.message,.profile
    ]
    CustomTabBarView(tabs: tabs,selection: .constant(tabs.first!),localSelection: tabs.first!)
}
