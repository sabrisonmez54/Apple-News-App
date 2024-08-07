//
//  NewsViewModel.swift
//  SwiftUINewsApp
//
//  Created by Sabri Sönmez on 8/7/24.
//

import Foundation
import Combine

@MainActor
class NewsViewModel: ObservableObject {
    @Published var articles = [NewsArticle]()
    @Published var showErrorAlert = false
    @Published var errorMessage = ""
    @Published var isLoading = false // Added to show loading state

    private var cancellables = Set<AnyCancellable>()
    
    func fetchNews() async {
           isLoading = true
           defer { isLoading = false } // Ensure loading state is reset

           do {
               let articles = try await NetworkManager.shared.fetchNews(from: "https://newsapi.org/v2/everything?q=apple&from=2024-08-06&to=2024-08-06&sortBy=popularity&apiKey=ebe39b84a2d34260ba7e9b6d8a76cc39")
               if Task.isCancelled { return } // Check if the task was cancelled
               self.articles = articles.filter({ NewsArticle in
                   NewsArticle.title != "[Removed]"
               })
           } catch {
               if Task.isCancelled { return } // Check if the task was cancelled
               showErrorAlert = true
               errorMessage = error.localizedDescription
           }
       }
    
}
