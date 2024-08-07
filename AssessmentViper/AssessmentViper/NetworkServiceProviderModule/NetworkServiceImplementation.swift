//
//  NetworkServiceImplementation.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation

class NetworkServiceImplementation: NetworkServiceProvider {
    
    /// fetch Repositories method and it will return the response and decode the response into swift's structures.
    func fetchData<T: Decodable>(with endpoint: NetworkEndPoint, completion: @escaping (Result<T, Error>) -> Void) {
        // check the url is valid or not.
        guard let url = endpoint.url else {
            // handle the error, if url is invalid.
            completion(.failure(NetworkError.invalidURL))
            return
        }
        // create the url request.
        var request = URLRequest(url: url)
        // add the timout interval.
        request.timeoutInterval = 30
        // add httpMethod to request.
        request.httpMethod = endpoint.method.rawValue
        if endpoint.authenticatedApi {
            // Set token, if required.
        }
        // add the headers, if have.
        endpoint.headers?.forEach({ (key, value) in
            request.setValue(value, forHTTPHeaderField: key)
        })
        // call the dataTask() method with request, and it will provide the call back of data, response and error.
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // check for the data, response and error
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                completion(.failure(error ?? NetworkError.unknownError))
                return
            }
            // if no error, check for status code.
            switch response.statusCode {
                // if status code from 200 to 299, it succees.
            case 200 ... 299:
                do {
                    // decode the data.
                    let decodedObject = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedObject))
                } catch {
                    // handle the decoded error.
                    completion(.failure(NetworkError.decodingError))
                }
            default:
                // handle the status code other than (200...299).
                completion(.failure(NetworkError.invalidStatusCode(response.statusCode)))
            }
        }
        // resume task.
        task.resume()
    }
}

