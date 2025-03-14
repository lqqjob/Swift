//
//  AppDetail.swift
//  iAppStore
//
//  Created by liqiang on 21/01/2025.
//

import Foundation
struct AppDetailM:Codable {
    let resultCount:Int
    let results:[AppDetail]
}
struct AppDetail:Codable {
    let advisories: [String]?
    let appletvScreenshotUrls: [String]?
    let artistId: Int
    let artistName: String
    let artistViewUrl: String?
    let artworkUrl100: String?
    let artworkUrl512, artworkUrl60: String
    let averageUserRating, averageUserRatingForCurrentVersion: Float
    let bundleId, contentAdvisoryRating, currency: String
    let currentVersionReleaseDate: String
    let description: String
    let features: [String]
    let fileSizeBytes: String?
    let formattedPrice: String?
    let genreIds, genres: [String]
    let ipadScreenshotUrls: [String]?
    let isGameCenterEnabled: Bool
    let isVppDeviceBasedLicensingEnabled: Bool
    let kind: String
    let languageCodesISO2A: [String]
    let minimumOsVersion: String
    let price: Double?
    let primaryGenreId: Int
    let primaryGenreName: String
    let releaseDate: String
    let releaseNotes: String?
    let screenshotUrls: [String]?
    let sellerName: String
    let sellerUrl: String?
    let supportedDevices: [String]
    let trackCensoredName: String
    let trackContentRating: String
    let trackId: Int
    let trackName: String
    let trackViewUrl: String
    let userRatingCount: Int
    let userRatingCountForCurrentVersion: Int
    let version: String
    let wrapperType: String
    
    var isSupportiPhone:Bool {
        if let urls = screenshotUrls,urls.isNotEmpty  {
            return true
        }
        return false
    }
    
    var isSupportiPad:Bool {
        if let urls = ipadScreenshotUrls,urls.isNotEmpty {
            return true
        }
        return false
    }
    
    var releaseTime:String {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dataFormatter.date(from: releaseDate) as Date? {
            let dateformat = DateFormatter()
            dateformat.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return dateformat.string(from: date)
        }else {
            return releaseDate
        }
    }
    
    var currentVersionReleaseTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: currentVersionReleaseDate) as Date? {
            let dateformat = DateFormatter()
            dateformat.dateFormat = "yyyy-MM-dd HH:mm:ss"
            return dateformat.string(from: date)
        } else {
            return currentVersionReleaseDate
        }
    }
    
    var fileSizeMB: String {
        if let sizeStr = fileSizeBytes, let size = Float(sizeStr) {
            let sizeMB = String(format: "%.1f", size / 1024 / 1024)
            guard let sizeM = Float(sizeMB), sizeM > 1024.0 else {
                return sizeMB + " MB"
            }
            return String(format: "%.2f GB", sizeM / 1024)
        }
        return "未知"
    }
    
    var averageRating: String {
        String(format: "%.1f", averageUserRating)
    }
    
    
    /// 截图展示大小
    var screenShotSize: CGSize {
        let width = 200.0
        let defaultSize = CGSize(width: width, height: width)
        let url = screenshotUrls?.first ?? ""
        let size = url.imageAppleSize()
        guard size != CGSize.zero else {
            return defaultSize
        }

        let height = Double(size.height) / Double(size.width) * width
        return CGSize(width: width, height: height);
    }
    
    static func getNewModel(_ artistId: String) -> AppDetail {
        return AppDetail(advisories: nil, appletvScreenshotUrls: nil, artistId: Int(artistId)!, artistName: "", artistViewUrl: nil, artworkUrl100: nil, artworkUrl512: "", artworkUrl60: "", averageUserRating: 0, averageUserRatingForCurrentVersion: 0, bundleId: "", contentAdvisoryRating: "", currency: "", currentVersionReleaseDate: "", description: "", features: [], fileSizeBytes: nil, formattedPrice: nil, genreIds: [], genres: [], ipadScreenshotUrls: [], isGameCenterEnabled: false, isVppDeviceBasedLicensingEnabled: false, kind: "", languageCodesISO2A: [], minimumOsVersion: "", price: 0, primaryGenreId: 0, primaryGenreName: "", releaseDate: "", releaseNotes: nil, screenshotUrls:nil, sellerName: "", sellerUrl: nil, supportedDevices: [], trackCensoredName: "", trackContentRating: "", trackId: 0, trackName: "", trackViewUrl: "", userRatingCount: 0, userRatingCountForCurrentVersion: 0, version: "", wrapperType: "")
    }
}
