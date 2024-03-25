//
//  SaveNavigationStackPathsUsingCodable.swift
//  Navigation
//
//  Created by liqiang on 2024/3/25.
//

import SwiftUI

@Observable
class PathStoreInt {
    var path:[Int] {
        didSet {
            save()
        }
    }
    private let savePath = URL.documentsDirectory.appending(path: "SavePath")
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoder = try? JSONDecoder().decode([Int].self, from: data){
                path = decoder
                return
            }
        }
        path = []
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(path)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")

        }
    }
}
    
@Observable
class PathStore {
    var path:NavigationPath {
        didSet {
            save()
        }
    }
    private let savePath = URL.documentsDirectory.appending(path: "SavePath")
    init() {
       
        if let data = try? Data(contentsOf: savePath) {
            if let data = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(data)
                return
            }
        }
        
        path = NavigationPath()
    }
    func save() {
        guard let representtation = path.codable else {
            return
        }
        
        do {
            let data = try JSONEncoder().encode(representtation)
            try data.write(to: savePath)
        }catch {
            print("Failed to save navigation data")

        }
    }
}


struct DetailView6:View {
    var number:Int
    var body: some View {
        NavigationLink("Go to Random Number",value: Int.random(in: 89...1000))
            .navigationTitle("Number:\(number)")
    }
}

struct SaveNavigationStackPathsUsingCodable: View {
    @State private var pathStore = PathStore()
    var body: some View {
        NavigationStack(path:$pathStore.path){
            DetailView6(number: 0)
                .navigationDestination(for: Int.self) { i in
                    DetailView6(number: i)
                }
            
        }
    }
}

#Preview {
    SaveNavigationStackPathsUsingCodable()
}
