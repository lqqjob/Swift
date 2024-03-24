//
//  Mission.swift
//  Moonshot
//
//  Created by liqiang on 2024/3/23.
//

import Foundation


struct Mission:Codable,Identifiable {
    struct CrewRole:Codable {//嵌套结构，只是放置在另一个结构内部的一个结构 它有助于保持代码井然有序：而不是说CrewRole，而是写Mission.CrewRole
        let name:String
        let role:String
    }
    
    let id: Int
    let launchDate:Date?
    let crew:[CrewRole]
    let description:String
    
    var displayName: String{
        "Apollo \(id)"
    }
    var image:String {
        "apollo\(id)"
    }
    var formattedLaunchDate:String {
        launchDate?.formatted(date: .abbreviated, time: .omitted) ?? "N/A"
    }
}
