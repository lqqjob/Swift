//
//  AppDetailModel.swift
//  iAppStore
//
//  Created by liqiang on 21/01/2025.
//

import Foundation

class AppDetailModel:ObservableObject {
    @Published var app:AppDetail? = nil
    @Published var results:[AppDetail] = []
    @Published var isLoading:Bool = false
    
    func searchAppData(_ appId:String?,_ keyWord:String?,_ regionName:String) {
        let regionId = TSMGConstants.regionTypeListIds[regionName] ?? "cn"
        
    }
}
