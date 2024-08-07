//
//  NetworkServiceProvider.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation

protocol NetworkServiceProvider {
    // fetchRepositories to fetch the data from the server and map into the concrete types.
    func fetchData<T: Decodable>(with endpoint: NetworkEndPoint, completion: @escaping (Result<T, Error>) -> Void)
}

