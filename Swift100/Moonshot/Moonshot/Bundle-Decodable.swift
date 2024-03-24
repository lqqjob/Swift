//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by liqiang on 2024/3/23.
//

import Foundation

extension Bundle {
    /// 2、使用泛型加载任何类型的可编码数据
    func decode<T:Codable>(_ file:String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        return loaded
    }
}
