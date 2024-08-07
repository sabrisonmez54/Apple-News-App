# Apple News Feed Reader

![News Feed App Screenshot](news_feed.png) 

A SwiftUI app that fetches and displays news articles from a public API, showcasing a modern and reactive approach to iOS development.

## Features

* Fetches news articles from a public news API (e.g., NewsAPI.org).
* Displays articles in a user-friendly list with titles, descriptions, and thumbnail images (if available).
* Presents article details in a separate view upon tapping a list item.
* Implements pull-to-refresh functionality to fetch the latest news.
* Handles network errors gracefully and provides user feedback.
* (Optional: Can be added in future versions) Allows users to search for specific news topics.

## Technologies Used

* SwiftUI:  For building the entire user interface, leveraging its declarative and composable nature.
* Combine:  For handling network requests, data parsing, and reactive UI updates.
* Async/await: For writing asynchronous code in a more readable and structured way.
* URLSession:  For making network requests to the news API.
* Codable:  For decoding JSON responses into Swift structs.
* NSCache: For efficient in-memory caching of downloaded images.

## Project Structure

* `ContentView.swift`:  The main view that displays the list of news articles.
* `ArticleDetailView.swift`: The view that shows the details of a selected article.
* `NewsArticle.swift`: The data model representing a news article.
* `NewsViewModel.swift`: The view model responsible for fetching and managing the news data.
* `NetworkManager.swift`:  A singleton class for handling network requests and image loading.

## Getting Started

1. Clone the repository: `git clone [repository URL]`
2. Open the project in Xcode.
3. Obtain an API key from a news API provider (e.g., NewsAPI.org).
4. Replace `"YOUR_API_KEY"` in `NewsViewModel.swift` with your actual API key.
5. Build and run the app on a simulator or device.

## Future Enhancements

* Search functionality to filter articles by keywords or topics.
* Offline mode with data persistence to allow viewing previously fetched articles without an internet connection.
* User customization options, such as choosing news categories or sources.
* Improved error handling and user feedback.
