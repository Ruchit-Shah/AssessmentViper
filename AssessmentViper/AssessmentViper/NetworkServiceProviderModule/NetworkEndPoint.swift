//
//  NetworkEndPoint.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation

protocol NetworkEndPoint {
    
    var path: Path { get set }
    var method: HTTPMethod { get set }
    var parameters: [String: String]? { get set }
    var headers: [String: String]? { get set }
    var authenticatedApi: Bool { get set }
    var baseURL: BaseURL { get set }
    var url: URL? { get }
    
}

struct NetworkEndPointImplementation: NetworkEndPoint {
    
   var path: Path = .university
   var method: HTTPMethod = .get
   var parameters: [String: String]?
   var headers: [String: String]?
   var authenticatedApi = false
   var baseURL: BaseURL = .baseUrl

    var url: URL? {
       var components = URLComponents()
       components.scheme = "http"
       components.host = baseURL.value
       components.path = path.name
       components.queryItems = parameters?.map { URLQueryItem(name: $0.key, value: "\( $0.value )") }
       return components.url
    }
}

