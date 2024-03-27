//
//  SendingAndReceivingDataWithURLSession.swift
//  CupcakeCorner
//
//  Created by liqiang on 2024/3/27.
//

import SwiftUI

struct Response:Codable {
    var results:[Result]
}

struct Result : Codable {
    var trackId:Int
    var trackName:String
    var collectionName:String
}
struct SendingAndReceivingDataWithURLSession: View {
    @State private var results = [Result]()
    var body: some View {
        List(results,id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
        }
        .task {
           await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
               return
        }
        
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            if let decodeedResponse  = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodeedResponse.results
            }else {
                print("Invalid data")

            }
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    SendingAndReceivingDataWithURLSession()
}
