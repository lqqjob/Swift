//
//  NetworkingManager.swift
//  iAppStore
//
//  Created by liqiang on 2025/2/10.
//

import Foundation
import Combine

class NetworkingManager {
    enum NetworkingError:LocalizedError {
        case baseURLResponse(url:URL)
        case unkown
        
        var errorDescription: String? {
            switch self {
            case .baseURLResponse(url: let url):
                return "[🔥] Bad response from URL: \(url)"
            case .unkown:
                return "[⚠️] Unknown error occured"
            }
        }
    }
    
    
    static func dowload(url:URL) -> AnyPublisher<Data,Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap({try handleURLResponse(output: $0, url: url)})
            .retry(2)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output:URLSession.DataTaskPublisher.Output,url:URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.baseURLResponse(url: url)
        }
        
        return output.data
    }
    
    static func handleCompetion(completion:Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)

        }
    }
}
