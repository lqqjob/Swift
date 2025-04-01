//
//  RankSortView.swift
//  iAppStore
//
//  Created by liqiang on 3/27/25.
//

import SwiftUI

struct RankSortView: View {
    
    public enum RankSortType:Int {
        case noneType
        case rankType
        case categoryType
        case regionType
    }
    
    @Binding var rankName:String
    @Binding var categoryName:String
    @Binding var regionName:String
    
    @State private var sortViewIsExpanded:Bool = false
    @State private var isViewAppear:Bool = false
    @State private var currentSortType:RankSortType = .noneType
    var action:((_ rankName:String,_ categoryName:String,_ regionName:String) -> Void)?
    
    var body: some View {
        HStack {
            DisclosureGroup(isExpanded: $sortViewIsExpanded) {
                sortContents
            } label: {
                sortLabels
                    .accentColor(Color.tsmg_label)
            }
            .buttonStyle(PlainButtonStyle())
            .accentColor(.clear)
        }
        .onAppear() {
            isViewAppear = true
        }
        .onDisappear() {
            sortViewIsExpanded = false
            currentSortType = .noneType
        }

    }
}
extension RankSortView {
    var sortContents:some View {
        VStack {
            Divider()
            if currentSortType == .rankType{
                rankContent
            }else if currentSortType == .categoryType {
                categoryContent
            }else if currentSortType == .regionType {
                regionContent
            }
        }
        .background(Color.tsmg_systemBackground)
        .frame(maxHeight: 210)
    }
    
    var rankContent: some View {
        ScrollView {
            ForEach(0..<TSMGConstants.rankingTypeLists.count,id: \.self) { index in
                buildSortListRow(index: index)
                
            }
        }
    }
    var categoryContent:some View {
        ScrollView {
            ForEach(0..<TSMGConstants.categoryTypeListIds.count,id: \.self) {index in
                buildSortListRow(index: index)
            }
        }
    }
    
    var regionContent:some View {
        ScrollView {
            ForEach(0..<TSMGConstants.regionTypeLists.count, id: \.self) {index in
                buildSortListRow(index: index)
            }
        }
    }
    func buildSortListRow(index:Int) -> some View {
        
        HStack {
            let (item,isSelected) = selectItem(index: index)
            if isSelected {
                selectedItem(item: item)
            }else {
                unselectedItem(item: item)
            }
            Spacer()
            if isSelected {
                checkmarkImage
            }
        }
        .background(Color.tsmg_systemBackground)
        .onTapGesture {
            onTapSortItem(index: index)
        }
    }
    func onTapSortItem(index:Int) {
        withAnimation {
            if currentSortType == .rankType {
                rankName = TSMGConstants.rankingTypeLists[index]
            }else if currentSortType == .categoryType {
                categoryName = TSMGConstants.categoryTypeLists[index]
            }else if currentSortType == .regionType {
                regionName = TSMGConstants.regionTypeLists[index]
            }
            sortViewIsExpanded = false
            currentSortType = .noneType
            
            if nil != action {
                action!(rankName, categoryName, regionName)
            }
        }
    }
    func selectItem(index:Int) -> (String,Bool) {
        var itemArray:[String] = []
        if currentSortType == .rankType {
            itemArray = TSMGConstants.rankingTypeLists
        }else if currentSortType == .categoryType {
            itemArray = TSMGConstants.categoryTypeLists
        }else if currentSortType == .regionType {
            itemArray = TSMGConstants.regionTypeLists
        }
        
        if index >= itemArray.count {
            return ("",false)
        }
        
        if currentSortType == .rankType {
            return (itemArray[index],itemArray[index] == rankName)
        }else if currentSortType == .categoryType {
            return (itemArray[index],itemArray[index] == categoryName)
        }else if currentSortType == .regionType {
            return (itemArray[index],itemArray[index] == regionName)
        }
        
        return ("",false)
    }
    
    func selectedItem(item:String) -> some View {
        Text(item)
            .padding(.horizontal)
            .padding(.vertical,5)
            .foregroundStyle(.blue)
    }
    
    func unselectedItem(item:String) -> some View {
        Text(item)
            .padding(.horizontal)
            .padding(.vertical,5)
    }
    
    var checkmarkImage:some View {
        Image(systemName: "checkmark")
            .padding(.horizontal)
            .padding(.vertical,5)
            .foregroundStyle(.blue)
    }
}
extension RankSortView {
    var sortLabels:some View {
        HStack {
            Spacer()
            rankLabel
            Spacer()
            categoryLabel
            Spacer()
            regionLabel
            Spacer()
        }
    }
    
    var rankLabel:some View {
        createSortLabel(type: .rankType)
    }
    var categoryLabel:some View {
        createSortLabel(type: .categoryType)
    }
    var regionLabel:some View {
        createSortLabel(type: .regionType)
    }
    
    func createSortLabel(type:RankSortType) -> some View {
        HStack {
            switch type {
            case .noneType:
                Text("")
            case .categoryType:
                Text(categoryName)
            case .regionType:
                Text(regionName)
            case .rankType:
                Text(rankName)
            }
            
            if isViewAppear {
                Image(systemName: "chevron.up")
                    .scaleEffect(x:1,y: currentSortType == type ?1:-1)
                    .animation(.easeIn, value: currentSortType)
            }else {
                Image(systemName: "chevron.up")
            }
        }
        .onTapGesture {
            if currentSortType == type {
                sortViewIsExpanded = false
                currentSortType = .noneType
            }else {
                sortViewIsExpanded = true
                currentSortType = type
            }
        }
    }
}
#Preview {
    RankSortView(rankName: .constant("1"), categoryName:  .constant("1"), regionName:  .constant("1")) { rankName, categoryName, regionName in
        print("")
    }
}
