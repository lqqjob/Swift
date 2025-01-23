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
}
