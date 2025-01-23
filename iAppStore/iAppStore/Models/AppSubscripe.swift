//
//  AppSubscripe.swift
//  iAppStore
//
//  Created by liqiang on 23/01/2025.
//

import Foundation
struct AppSubscripe : Codable {
    let appId: String
    let regionName: String
    let subscripeType: Int
    let currentVersion: String
    let newVersion: String?
    let startTimeStamp: TimeInterval
    var endCheckTimeStamp: TimeInterval?
    let isFinished: Bool
    let iconURL: String?
    let trackName: String
    
    var startTime:String {
        let date = Date.init(timeIntervalSince1970: startTimeStamp)
        let dateformat = DateFormatter()
        dateformat.dateFormat = "yyyy-MM-dd HH:mm"
        return dateformat.string(from: date)
    }
    
    var finishTime:String {
        if let time = endCheckTimeStamp {
            let date = Date.init(timeIntervalSince1970: time)
            let dateformat = DateFormatter()
            dateformat.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return dateformat.string(from: date)
        }
        return "-"
    }
    
    var artworkURL100: String {
        guard let iconURL = iconURL else {
            return "http://itunes.apple.com/favicon.ico"
        }
        return iconURL
    }
    
    static func updateModel(app: AppSubscripe, checkTime: TimeInterval, isFinished: Bool, _ newVersion: String?) -> AppSubscripe {
        return AppSubscripe(
            appId: app.appId,
            regionName: app.regionName,
            subscripeType: app.subscripeType,
            currentVersion: app.currentVersion,
            newVersion: (newVersion != nil) ? newVersion : app.newVersion,
            startTimeStamp: app.startTimeStamp,
            endCheckTimeStamp: checkTime,
            isFinished: isFinished,
            iconURL: app.iconURL,
            trackName: app.trackName
        )
    }
}
