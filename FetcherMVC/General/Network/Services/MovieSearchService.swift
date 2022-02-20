//
//  MovieSearchService.swift
//  FetcherMVC
//
//  Created by Shalom Friss on 2/17/22.
//

import Foundation

class MovieSearchService {
    //MARK:- Network calls
    /// Search for a movie
    /// - Parameters:
    ///   - searchTerm: String - The term to search for
    ///   - completion: Result<ResultsVO, NetworkError>
    public func fetch(searchTerm:String, completion: @escaping (Result<MoviesearchResultsModel, NetworkError>) -> Void) {
        let urlString = String(format: Paths.search.apiPath(), Constants.api_key.rawValue, searchTerm)
        
        //Create the url
        guard let escapedString = urlString.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
                let url = URL(string: escapedString) else {
            completion(.failure(NetworkError.badURL))
            return
        }
        
        let request = URLRequest(url: url)
        NetworkManager.shared.makeRequest(request: request, skipCache: false) { result in
            switch(result) {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let results =  try decoder.decode(MoviesearchResultsModel.self, from: data)
                    completion(.success(results))
                } catch {
                    completion(.failure(NetworkError.parseError))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
