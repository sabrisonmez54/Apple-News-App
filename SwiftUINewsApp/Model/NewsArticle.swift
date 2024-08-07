//
//  NewsArticle.swift
//  SwiftUINewsApp
//
//  Created by Sabri Sönmez on 8/7/24.
//

import Foundation

struct NewsArticle: Identifiable, Codable {
    var id: UUID { UUID() }
    let source: Source
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
}

struct Source: Codable {
    let id: String?
    let name: String
}

struct NewsResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [NewsArticle]
}
