//
//  User.swift
//  SwiftDataProject
//
//  Created by liqiang on 2024/4/5.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city:String
    var joinDate:Date
    //级联删除
    @Relationship(deleteRule:.cascade)  var jobs = [Job]()
    init(name: String, city: String, joinDate: Date) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
