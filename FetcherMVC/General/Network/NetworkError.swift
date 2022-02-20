//
//  NetworkError.swift
//  FetcherMVC
//
//  Created by Shalom Friss on 2/17/22.
//

import Foundation

enum NetworkError: Error {
    case genericError(error:Error)
    case badURL
    case emptyResponse
    case emptyData
    case parseError
    case networkError(code:Int)
}
