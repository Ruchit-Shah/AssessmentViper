//
//  NetworkPath.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

enum BaseURL: String {
    
    case baseUrl
    
    var value: String {
        switch self {
        case .baseUrl:
            return "universities.hipolabs.com"
        }
    }
}

enum Path: String {
    
    case university    
    var name: String {
        switch self {
        case .university:
            return "/search"
        }
    }
}
