//
//  AppSubscripeModel.swift
//  iAppStore
//
//  Created by liqiang on 23/01/2025.
//

import Foundation
class AppSubscripeModel : ObservableObject {
    @Published private(set) var subscripes:[AppSubscripe] {
        didSet {
            saveSubscripes()
        }
    }
    private var time:Timer?
    private let interval:TimeInterval = 30
    private let modelName = "AppSubscripeModel"
    private let folderName = "AppSubscripe"
    
    init() {
        subscripes = []
    }
    
    func saveSubscripes() {
        
    }
    
    func subscribeExist(appId:String) -> Bool {
        let subscripe = subscripes.first {  $0.appId == appId }
        return subscripe != nil
    }
    
    func addSubscribe(appId:String,regionName:String,subscribe:Int,appDetail:AppDetail?){
        let subscripe = AppSubscripe(
            appId: appId,
            regionName: regionName,
            subscripeType: subscribe,
            currentVersion: appDetail?.version ?? "",
            newVersion: nil,
            startTimeStamp: Date().timeIntervalSince1970,
            endCheckTimeStamp: nil,
            isFinished: false,
            iconURL: appDetail?.artworkUrl100,
            trackName: appDetail?.trackName ?? ""
        )
        subscripes.append(subscripe)
    }
}
