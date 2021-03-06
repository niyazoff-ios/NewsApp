//
//  NetworkService.swift
//  NewsApp
//
//  Created by IOS-Developer on 21.02.2021.
//  Copyright © 2021 IOS-Developer. All rights reserved.
//

import Foundation
protocol NetworkServiceProtocol {
    func getNews(completion: @escaping (Result<NewsModel, Error>) -> Void)
}
class NetworkService: NetworkServiceProtocol {
    func getNews(completion: @escaping (Result<NewsModel, Error>) -> Void) {
        let apiKey = "7Ft2j397EkCDjdNz6GnPmBgF9dGYQ6ki"
        let urlString = "https://api.nytimes.com/svc/topstories/v2/arts.json?api-key=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let decoder = JSONDecoder()
                guard let data = data else { return }
                let response = try decoder.decode(NewsModel.self, from: data)
                print(response)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
 
