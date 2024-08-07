//
//  APICallHandler.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation


class RemoteUniversityDataSource: APICaller {
    
    private let networkService: NetworkServiceProvider

    init(networkService: NetworkServiceProvider = NetworkServiceImplementation()) {
        self.networkService = networkService
    }

    func fetchUniversities(completion: @escaping (Result<[University], Error>) -> Void) {
        let qParam = ["country": "United Arab Emirates"]
        let endPoint = NetworkBuilder()
            .setPath(.university)
            .setMethod(.get)
            .setAuthenticated(false)
            .setQueryParameters(qParam)
            .build()
        
        networkService.fetchData(with: endPoint) { (result: Result<[University], Error>) in
            switch result {
            case .success(let universities):
                completion(.success(universities))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

