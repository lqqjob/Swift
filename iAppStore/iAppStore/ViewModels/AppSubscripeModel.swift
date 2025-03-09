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
    private var timer:Timer?
    private let interval:TimeInterval = 30
    private let modelName = "AppSubscripeModel"
    private let folderName = "AppSubscripe"
    
    init() {
        subscripes = LocalFileManager.instance.getModel(modelName: modelName, folderName: folderName)
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(handleTimer(_:)), userInfo: nil, repeats: true)
    }
    deinit {
        timer?.invalidate()
        timer = nil
    }
    @objc private func handleTimer(_ timer:Timer?) {
        subscripes.enumerated().forEach { (index,app) in
            if !app.isFinished {
                checkStatus(app,index:index)
            }
        }
    }
    private func checkStatus(_ app:AppSubscripe,index:Int) {
        let regionId = TSMGConstants.regionTypeListIds[app.regionName] ?? "cn"
        let endPoint:APIService.EndPoint = APIService.EndPoint.lookupApp(appid: app.appId, country: regionId)
        APIService.shared.POST(endpoint: endPoint, params: nil) { (result:Result<AppDetailM,APIService.APIError>) in
            switch result {
            case let .success(response):
                switch app.subscripeType {
                case 0:
                    if response.resultCount > 0 {
                        let model = response.results.first!
                        if app.currentVersion != model.version {
                            let new = AppSubscripe.updateModel(app: app, checkTime: Date().timeIntervalSince1970, isFinished: true, model.version)
                            self.subscripes[index] = new
                            return
                        }
                        let new = AppSubscripe.updateModel(app: app, checkTime: Date().timeIntervalSince1970, isFinished: false, nil)
                        self.subscripes[index] = new
                    }
                    break;
                case 1:
                    if response.resultCount > 0 {
                        let model = response.results.first!
                        let new = AppSubscripe.updateModel(app: app, checkTime: Date().timeIntervalSince1970, isFinished: true, model.version)
                        self.subscripes[index] = new
                    }else {
                        let new = AppSubscripe.updateModel(app: app, checkTime: Date().timeIntervalSince1970, isFinished: false, nil)
                        self.subscripes[index] = new
                    }
                
                    break;
                case 2:
                    if response.resultCount == 0 {
                        let new = AppSubscripe.updateModel(app: app, checkTime: Date().timeIntervalSince1970, isFinished: true, nil)
                        self.subscripes[index] = new
                    }else {
                        let new = AppSubscripe.updateModel(app: app, checkTime: Date().timeIntervalSince1970, isFinished: false, nil)
                        self.subscripes[index] = new
                    }
                    break;
                default:
                    break;
                }
            
            case .failure(_):
                break;
                
            }
        }
    }
    private func saveSubscripes() {
        LocalFileManager.instance.saveModel(model: subscripes, modelName: modelName, folderName: folderName)
    }
    
    func subscribeExist(appId:String) -> Bool {
        let subscripe = subscripes.first {  $0.appId == appId }
        return subscripe != nil
    }
    func removeAt(indexSet:IndexSet) {
        subscripes.remove(atOffsets: indexSet)
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
