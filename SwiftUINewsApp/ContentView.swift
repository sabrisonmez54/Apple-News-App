//
//  ContentView.swift
//  SwiftUINewsApp
//
//  Created by Sabri Sönmez on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NewsViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    ProgressView("Loading News...")
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    List(viewModel.articles) { article in
                        NavigationLink(destination: ArticleDetailView(article: article)) {
                            HStack {
                                if let urlToImage = article.urlToImage, let imageUrl = URL(string: urlToImage) {
                                    AsyncImage(url: imageUrl) { phase in
                                        if let image = phase.image {
                                            image
                                                .resizable()
                                                .scaledToFit()
                                        } else if phase.error != nil {
                                            Image(systemName: "exclamationmark.triangle.fill")
                                                .foregroundColor(.red)
                                                .frame(width: 80, height: 80)
                                        } else {
                                            ProgressView()
                                                .frame(width: 80, height: 80)
                                        }
                                    }
                                    .frame(width: 80, height: 80)
                                }

                                VStack(alignment: .leading) {
                                    Text(article.title)
                                        .font(.headline)
                                    Text(article.description ?? "")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Apple News Feed")
            .refreshable {
                await viewModel.fetchNews()
            }
            .task {
                await viewModel.fetchNews()
            }
            .alert("Error", isPresented: $viewModel.showErrorAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.errorMessage)
            }
        }
    }
}


#Preview {
    ContentView()
}
