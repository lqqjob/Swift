//
//  Result.swift
//  BucketList
//
//  Created by liqiang on 2024/4/22.
//

import Foundation
struct Page:Codable,Comparable {
    let pageid:Int
    let title:String
    let terms:[String:[String]]?
    var description:String {
        terms?["description"]?.first ?? "No further information"
    }
    static func <(lhs:Page,rhs:Page) -> Bool {
        lhs.title < rhs.title
    }
}
struct Query:Codable {
    let pages:[Int:Page]
}
struct Result : Codable {
    let query:Query
}
