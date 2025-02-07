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
        var endPoint:APIService.EndPoint = APIService.EndPoint.lookupApp(appid: "", country: "")
        if let appId = appId {
            endPoint = APIService.EndPoint.lookupApp(appid: appId, country: regionId)
        }
        if let word = keyWord,let encodeword = word.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            endPoint = APIService.EndPoint.searchApp(word: encodeword, country: regionId, limit: 200)
        }
        
        isLoading = true
        
        APIService.shared.POST(endpoint: endPoint, params: nil) {(result: Result<AppDetailM, APIService.APIError>) in
            self.isLoading = false
            switch result {
            case let .success(response):
                self.results = response.results
                if appId != nil {
                    self.app = response.results.first
                }
                if let word = keyWord {
                    self.lookupBundleId(word: word, regionId: regionId)
                }
            case .failure(_):
                break
            }
            
        }
    }
    
    func lookupBundleId(word:String,regionId:String) {
        guard let bundleId = word.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        let endPoint = APIService.EndPoint.lookupBundleId(appid: bundleId, country: regionId)
        APIService.shared.POST(endpoint: endPoint, params: nil) { (result: Result<AppDetailM, APIService.APIError>)  in
            switch result {
            case .success(let success):
                if let app = success.results.first {
                    self.results.insert(app, at: 0)
                }
            case .failure(_):
                break
            }
        }
    }
    
    func lookupAppId(_ appId:String,_ regionName:String) {
        let regionId = TSMGConstants.regionTypeListIds[regionName] ?? "cn"
        let endPoint = APIService.EndPoint.lookupApp(appid: appId, country: regionId)
        APIService.shared.POST(endpoint: endPoint, params: nil) {(result: Result<AppDetailM, APIService.APIError>) in
            switch result {
            case let .success(response):
                if let app = response.results.first {
                    self.results.append(app)
                }
            case .failure(_):
                break
            }
        }
    }
}
