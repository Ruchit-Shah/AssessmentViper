//
//  NetworkBuilder.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation

class NetworkBuilder {

    private var path: Path = .university
    private var method: HTTPMethod = .get
    private var authenticated: Bool = false
    private var parameters: [String: String]?
    
    @discardableResult
    func setPath(_ value: Path) -> NetworkBuilder {
        self.path = value
        return self
    }
    
    @discardableResult
    func setMethod(_ value: HTTPMethod) -> NetworkBuilder {
        self.method = value
        return self
    }
    
    @discardableResult
    func setAuthenticated(_ value: Bool) -> NetworkBuilder {
        self.authenticated = value
        return self
    }
    
    @discardableResult
    func setQueryParameters(_ value: [String: String]) -> NetworkBuilder {
        self.parameters = value
        return self
    }
    
    func build() -> NetworkEndPoint {
        var endpoint = NetworkEndPointImplementation()
        endpoint.method = method
        endpoint.path = path
        endpoint.authenticatedApi = authenticated
        endpoint.parameters = parameters
        return endpoint
    }
    
}
