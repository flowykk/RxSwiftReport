//
//  Networking.swift
//  RxSwiftTable
//
//  Created by Данила Рахманов on 06.11.2024.
//

import Foundation

enum FetchError: Error {
    case failed
}

final class NetworkManager {
    static var shared = NetworkManager()
    
    func getArticles(completion: @escaping (Result<[Article], Error>) -> ()) {
        // https://newsapi.org/v2/everything?q=ElonMusk&apiKey=779f499fe6b24cf98b6f3931221f34c9
        if let url = URL(string: "https://newsapi.org/v2/everything?q=ElonMusk&apiKey=779f499fe6b24cf98b6f3931221f34c9") {
            URLSession.shared.dataTask(with: url) { data, _, error in
                guard error == nil else {
                    completion(.failure(FetchError.failed))
                    return
                }
                
                if let data {
                    do {
                        let response = try JSONDecoder().decode(Response.self, from: data)
                        completion(.success(response.articles))
                    } catch {
                        completion(.failure(FetchError.failed))
                    }
                }
            }.resume()
        }
    }
}
