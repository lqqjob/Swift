//
//  AppFavoritesModel.swift
//  iAppStore
//
//  Created by liqiang on 4/1/25.
//

import SwiftUI

class AppFavoritesModel {
    public static let shared = AppFavoritesModel()
    
    
    func search(_ appId:String) -> AppFavorite? {
        let favorites = appFavorites()
        return favorites.first {$0.appId == appId}
    }
    func add(_ app:AppFavorite) {
        var favorites = appFavorites()
        if let index = favorites.firstIndex(where: { $0.appId == app.appId}) {
            favorites[index] = app
        }else {
            favorites.append(app)
        }
        saveFavorites(favorites)
    }
    
    @discardableResult
    func remove(appId:String) -> Int {
        var favorites = appFavorites()
        if let index = favorites.firstIndex(where: { $0.appId == appId }) {
            favorites.remove(at: index)
            saveFavorites(favorites)
            return 1
        }
        
        return -1
    }
    func appFavorites() -> [AppFavorite] {
        let userDefaults = UserDefaults.standard
        if let data = userDefaults.data(forKey: "AppFavorites") {
            if let decodeData = try? JSONDecoder().decode([AppFavorite].self, from: data) {
                return decodeData
            }
        }
        return []
    }
    
    func saveFavorites(_ favorites:[AppFavorite]) {
        let userDefault = UserDefaults.standard
        if let encodeData = try? JSONEncoder().encode(favorites) {
            userDefault.set(encodeData, forKey: "AppFavorites")
        }
    }
}
