//
//  Prospect.swift
//  HotProspects
//
//  Created by liqiang on 2024/5/5.
//

import Foundation
import SwiftData

@Model
class Prospect {
    var name:String
    var emailAddress:String
    var isContacted:Bool
    init(name: String, emailAddress: String, isContacted: Bool) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
    }
}
