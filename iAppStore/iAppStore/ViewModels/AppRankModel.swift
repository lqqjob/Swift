//
//  AppRankModel.swift
//  iAppStore
//
//  Created by Mlqq on 2025/3/10.
//

import Foundation
import SwiftUI
import Combine
class AppRankModel:ObservableObject {
    @Published var rankTitle:String = "排行榜"
    @Published var rankUpdated:String = ""
    @Published var results:[AppRank] = []
    
    @Published var alertMsg:String = ""
    @Published var isShowAlert:Bool = false
    private var cancelable = Set<AnyCancellable>()
    @Published var isLoading:Bool = false
    
    init(){
        self.addSubcriber()
    }
    private func addSubcriber() {
        
    }
    
}
