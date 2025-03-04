//
//  AppSubscripeModel.swift
//  iAppStore
//
//  Created by liqiang on 23/01/2025.
//

import Foundation
class AppSubscripeModel : ObservableObject {
    @Published private(set) var subscripe:[AppSubscripe] {
        didSet {
            saveSubscripes()
        }
    }
    private var time:Timer?
    private let interval:TimeInterval = 30
    private let modelName = "AppSubscripeModel"
    private let folderName = "AppSubscripe"
    
    init() {
        subscripe = []
    }
    
    func  saveSubscripes() {
        
    }
    
    func subscribeExist(appId:String) -> Bool {
        let subscripe = subscripe.first {  $0.appId == appId }
        return subscripe != nil
    }
    
    func addSubscribe(appId:String,regionName:String,subscribe:Int,appDetail:AppDetail?){
        let subscripe = AppSubscripe(appId: appId, regionName: regionName, subscripeType: subscribe, currentVersion: appDetail?.version ?? "", newVersion: nil, startTimeStamp: Date().timeIntervalSince1970, isFinished: false, iconURL: appDetail?.artworkUrl100, trackName: appDetail?.trackName ?? "")
    }
}
