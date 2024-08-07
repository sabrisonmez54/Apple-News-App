//
//  ArticleDetailView.swift
//  SwiftUINewsApp
//
//  Created by Sabri Sönmez on 8/7/24.
//

import SwiftUI

struct ArticleDetailView: View {
    let article: NewsArticle

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                if let urlToImage = article.urlToImage, let imageUrl = URL(string: urlToImage) {
                    AsyncImage(url: imageUrl) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else if phase.error != nil {
                            Image(systemName: "exclamationmark.triangle.fill")
                                .foregroundColor(.red)
                        } else {
                            ProgressView()
                        }
                    }
                    .frame(maxHeight: 300)
                }
                
                Text(article.title)
                    .font(.largeTitle)
                    .padding()

                Text(formatDate(article.publishedAt))
                    .font(.headline)
                    .padding()

                Text(article.description ?? "")
                    .padding()

                Link("Read More", destination: URL(string: article.url)!)
                    .padding()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline) // Ensure the title is fully visible
    }

    func formatDate(_ dateString: String) -> String {
        let formatter = ISO8601DateFormatter()
        if let date = formatter.date(from: dateString) {
            let displayFormatter = DateFormatter()
            displayFormatter.dateStyle = .medium
            displayFormatter.timeStyle = .short
            return displayFormatter.string(from: date)
        }
        return dateString
    }
}
