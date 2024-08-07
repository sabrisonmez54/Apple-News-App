//
//  NetworkManager.swift
//  SwiftUINewsApp
//
//  Created by Sabri Sönmez on 8/7/24.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
}

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func fetchNews(from urlString: String) async throws -> [NewsArticle] {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalidResponse
        }

        do {
            let newsResponse = try JSONDecoder().decode(NewsResponse.self, from: data)
            return newsResponse.articles
        } catch {
            throw NetworkError.decodingError
        }
    }
}


//class NetworkManager: ObservableObject {
//    @Published var articles: [NewsArticle] = []
//    private var cancellables = Set<AnyCancellable>()
//    
//    private let apiKey = "YOUR_API_KEY"
//    
//    func fetchNews() {
//        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)") else {
//            print("Invalid URL")
//            return
//        }
//        
//        URLSession.shared.dataTaskPublisher(for: url)
//            .map { $0.data }
//            .decode(type: NewsResponse.self, decoder: JSONDecoder())
//            .map { $0.articles }
//            .replaceError(with: [])
//            .receive(on: DispatchQueue.main)
//            .assign(to: \.articles, on: self)
//            .store(in: &cancellables)
//    }
//}
