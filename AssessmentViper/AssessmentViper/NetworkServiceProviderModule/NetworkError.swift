//
//  NetworkError.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case unknownError
    case decodingError
    case invalidStatusCode(Int)
}
 
// Mark:- Network Error's description
extension NetworkError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid url passed in request"
        case .invalidStatusCode(let code):
            return "StatusCode should be 2xx, but is \(code)"
        case .decodingError:
            return "Decoded Error"
        case .unknownError:
            return "unknown error"
        }
    }
}
