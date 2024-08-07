//
//  UniversityDataHandler.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation


class UniversityDataHandler: APICaller {
    
    private let remoteDataSource: APICaller
    private let localDataSource: LocalDataHandler

    init(remoteDataSource: APICaller, localDataSource: LocalDataHandler) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }

    func fetchUniversities(completion: @escaping (Result<[University], Error>) -> Void) {
        remoteDataSource.fetchUniversities { [weak self] remoteResult in
            switch remoteResult {
            case .success(let universities):
                completion(.success(universities))
                // Optionally save universities to Core Data here
                self?.saveToLocalDataSource(universities: universities)
            case .failure(let remoteError):
                self?.localDataSource.fetchUniversities { localResult in
                    switch localResult {
                    case .success(let universities):
                        completion(.success(universities))
                    case .failure(let localError):
                        // Handle the case where both remote and local fetches fail
                        completion(.failure(self?.resolveError(remoteError: remoteError, localError: localError) ?? remoteError))
                    }
                }
            }
        }
    }

    private func saveToLocalDataSource(universities: [University]) {
        // Implement saving logic here
        localDataSource.saveUniversities(universities)
        
    }

    private func resolveError(remoteError: Error, localError: Error) -> Error {
        // Implement your custom error handling logic here
        // For instance, you might want to prioritize the remote error or create a combined error
        return NSError(domain: "com.example.university", code: -1, userInfo: [
            NSLocalizedDescriptionKey: "Failed to fetch universities from both remote and local data sources. Remote error: \(remoteError.localizedDescription), Local error: \(localError.localizedDescription)"
        ])
    }
}

