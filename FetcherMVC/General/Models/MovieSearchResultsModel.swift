//
//  MovieSearchResultsModel.swift
//  FetcherMVC
//
//  Created by Shalom Friss on 2/17/22.
//

import Foundation


// MARK: - Results

/// Results data object
public class MoviesearchResultsModel: NSObject, Codable {
    public let page: Int?
    public let totalResults: Int?
    public let totalPages: Int?
    public let results: [ResultVO]?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results = "results"
    }
    
    public init(page: Int?, totalResults: Int?, totalPages: Int?, results: [ResultVO]?) {
        self.page = page
        self.totalResults = totalResults
        self.totalPages = totalPages
        self.results = results
    }
}
