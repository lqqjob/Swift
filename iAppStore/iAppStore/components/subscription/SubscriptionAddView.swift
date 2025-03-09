//
//  SubscriptionAddView.swift
//  iAppStore
//
//  Created by liqiang on 23/01/2025.
//

import SwiftUI


enum SubscripeAddAlertType:Identifiable {
    case parameterError, searchEmptyError, existCheckError
    var id:Int {hashValue}
}

struct SubscriptionAddView: View {
    @Binding var isAddPresented:Bool
    @ObservedObject var subscripeVM:AppSubscripeModel
    
    @State private var subscripeType = 0
    @State private var appleIdText:String = ""
    @State private var regionName:String  = "中国"
    @State private var filterViewIsExpanded = false
    @StateObject private var detailVM = AppDetailModel()
    @State private var alertType:SubscripeAddAlertType?
    var body: some View {
        VStack {
            titleView.padding(.bottom,20)
            ScrollView {
                subscribeTypeRow.padding(.bottom,15)
                appRegionRow
                if filterViewIsExpanded == true {
                    Divider()
                    regionExpandView
                        .background(Color.tsmg_systemBackground)
                        .frame(maxHeight: 300)
                    Divider()
                }
                
                if subscripeType == 1 {
                    searchNewAppRow
                        .padding(.bottom,15)
                }else {
                    searchUpdateOrRemoveAppRow.padding(.bottom,15)
                    if detailVM.app != nil && !detailVM.isLoading {
                        List {
                            Text("确认此 App 就是新的订阅的应用，否则请重新搜索～").font(.footnote)
                            ForEach(detailVM.results,id: \.trackId) {item in
                                let index = detailVM.results.firstIndex {
                                    $0.trackId == item.trackId
                                }
                                SearchCellView(index: index ?? 0, item: item).frame(height:110)
                                
                            }
                        }
                        .frame(minHeight: 180)
                        .padding(.bottom,15)
                        HStack {
                            Text("当前版本：").font(.footnote)
                            Text(detailVM.app?.version ?? "未知")
                            Spacer()
                        }
                        .padding(.bottom,15)
                    }
                }
                
                confirmButton.padding([.top,.bottom],25)
            }
            .padding([.leading,.trailing],12)
            Spacer()
        }
        .alert(item: $alertType) {
            alertContent($0)
        }
    }
    
    func alertContent(_ type:SubscripeAddAlertType) -> Alert {
        var error = ""
        switch type {
        case .parameterError:
            error = "当前填写的参数不完整，请检查清楚～"
        case .searchEmptyError:
            error = "搜索内容不能为空～"
        case .existCheckError:
            error = "已经存在相同 App ID 的检查项，请检查确认～"
        }
        return Alert(title: Text("提示"),message: Text(error),dismissButton: .default(Text("确认")))
    }
    func commitSearchApp() {
        if appleIdText.isNotEmpty,subscripeType != 1 {
            detailVM.searchAppData(appleIdText, nil, regionName)
        }
    }
    
    func onSearchButtonPress() {
        guard appleIdText.isNotEmpty else {
            alertType = .searchEmptyError
            return
        }
        
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        commitSearchApp()
    }
    func onConfirmButtonPress() {
        if appleIdText.isEmpty || (subscripeType != 1 && detailVM.app == nil) {
            alertType = .parameterError
            return
        }
        
        if subscripeVM.subscribeExist(appId: appleIdText) {
            alertType = .existCheckError
            return
        }
        
        subscripeVM.addSubscribe(appId: appleIdText, regionName: regionName, subscribe: subscripeType, appDetail: detailVM.app)
        
        isAddPresented = false
        
    }
}

extension SubscriptionAddView {
    var titleView:some View {
        HStack {
            Spacer().frame(width: 50)
            Spacer()
            Text("添加新订阅")
                .font(.title3)
                .fontWeight(.bold)
                .padding([.top,.leading],12)
            Spacer()
            
            Button {
                isAddPresented = false
            } label: {
                Text("取消")
                    .font(.body)
            }
            .frame(width: 60,height: 60,alignment: .center)
            .padding([.top,.trailing],8)
        }
    }
    
    var subscribeTypeRow:some View {
        HStack {
            Text("订阅类型")
                .font(.footnote)
            Picker("选择订阅类型",selection: $subscripeType){
                Text("版本更新").tag(0)
                Text("应用上架").tag(1)
                Text("应用下架").tag(2)
            }
            .pickerStyle(.segmented)
            .onChange(of: self.subscripeType) { [subscripeType] (newValue) in
                if newValue != subscripeType,detailVM.app != nil {
                    detailVM.app = nil
                }
            }
            Spacer()
        }
    }
    
    
    var appRegionRow:some View {
        HStack {
            Text("App 地区:").font(.footnote)
            Button {
                withAnimation {
                    filterViewIsExpanded.toggle()
                }
            } label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .imageScale(.medium)
                Text(regionName)
            }
            Spacer()
        }
    }
    
    var searchNewAppRow: some View{
        HStack {
            Text("App Id:").font(.footnote)
            let searchBar = TextField("请输入新 App 的 App ID",text: $appleIdText,onCommit: commitSearchApp)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            if #available(iOS 15.0, *) {
                searchBar.submitLabel(.done)
            }else {
                searchBar
            }
            
        }
    }
    var searchUpdateOrRemoveAppRow:some View {
        HStack {
            Text("搜索 App:").font(.footnote)
            let searchBar = TextField("请输入 App 的 App ID",text: $appleIdText,onCommit: commitSearchApp)
                .textFieldStyle(.roundedBorder)
            if #available(iOS 15.0, *) {
                searchBar.submitLabel(.done)
            }else {
                searchBar
            }
            Button {
                onSearchButtonPress()
            } label: {
                if detailVM.isLoading {
                    ProgressView()
                }else {
                    Text("搜索")
                }
            }

        }
    }
    var regionExpandView:some View {
        ScrollView {
            ForEach(0..<TSMGConstants.regionTypeLists.count,id: \.self) { index in
                HStack {
                    let type = TSMGConstants.regionTypeLists[index]
                    if type == regionName {
                        Text(type)
                            .padding(.horizontal)
                            .padding(.top,10)
                            .foregroundColor(.blue)
                    }else {
                        Text(type)
                            .padding(.horizontal)
                            .padding(.top,10)
                    }
                    Spacer()
                    if type == regionName {
                        Image(systemName: "checkmark")
                            .padding(.horizontal)
                            .padding(.top,10)
                            .foregroundColor(.blue)
                    }
                }
                .background(Color.tsmg_systemBackground)
                .onTapGesture {
                    let type = TSMGConstants.regionTypeLists[index]
                    withAnimation {
                        regionName = type
                        filterViewIsExpanded = false
                    }
                }
            }
        }
    }
    
    var confirmButton:some View {
        Button {
            onConfirmButtonPress()
        } label: {
            Text("确认添加")
                .font(.title3)
                .foregroundColor(.blue)
                .padding([.leading,.trailing],15)
                .padding([.top,.bottom],8)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.blue,lineWidth: 1)
                }
        }

    }
}

#Preview {
    SubscriptionAddView(isAddPresented: .constant(true), subscripeVM: AppSubscripeModel())
}
