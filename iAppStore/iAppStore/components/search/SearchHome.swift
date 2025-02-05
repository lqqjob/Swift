//
//  SearchHome.swift
//  iAppStore
//
//  Created by liqiang on 20/01/2025.
//

import SwiftUI

struct SearchHome: View {
    @State private var isSearching = false
    @State private var searchText = ""
    @AppStorage("kSearchRegionName") private var regionName:String = "中国"
    @State private var filterViewIsExpanded = false
    @StateObject private var appModel = AppDetailModel()
    
    var body: some View {
        NavigationView {
            Group{
                SearchBarView(searchText: $searchText, regionName: $regionName, appModel: appModel).padding([.leading,.trailing])
                ZStack{
                    List {
                        ForEach(appModel.results,id: \.trackId) {item in
                            let index = appModel.results.firstIndex {$0.trackId == item.trackId}
                            
                            NavigationLink(destination: AppDetailView()) {
                                
                            }
                        }
                    }
                }
                Spacer()
            }
            .navigationTitle("搜索")
            .navigationBarTitleDisplayMode(.automatic)
            .navigationBarItems(trailing: HStack{filterButton})
        }
    }
    
    private var filterButton:some View {
        Button {
            filterViewIsExpanded.toggle()
        } label: {
            HStack {
                Image(systemName: "line.3.horizontal.decrease.circle").imageScale(.medium)
                Text(regionName)
            }
            .frame(height: 30)
        }

    }
}

struct SearchBarView:View {
    @Binding var searchText:String
    @Binding var regionName:String
    @ObservedObject var appModel:AppDetailModel
    @State private var isSearching = false
    var body: some View {
        HStack {
            ZStack {
                Rectangle().foregroundColor(Color.tsmg_tertiarySystemGroupedBackground).cornerRadius(10)
                    .frame(height: 40)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .padding(.leading,8)
                    let searchBar = TextField("游戏、App 等", text: $searchText, onEditingChanged: changedSearch,onCommit: fetchSearch)
                        .textFieldStyle(.plain)
                    if #available(iOS 15, *) {
                        searchBar.submitLabel(.search)
                    }else {
                        searchBar
                    }
                    if(searchText.isNotEmpty) {
                        Button {
                            searchText = ""
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                        }

                    }
                }
            }
            if(searchText.isNotEmpty) {
                Button {
                    cancelSearch()
                } label: {
                    Text("取消").foregroundColor(.blue)
                }
                .buttonStyle(PlainButtonStyle())

            }
        }
    }
    
    func changedSearch(isEditing:Bool) {
        
    }
    func fetchSearch() {
        
    }
    func cancelSearch() {
        searchText = ""
        appModel.results = []
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#Preview {
    SearchHome()
}
