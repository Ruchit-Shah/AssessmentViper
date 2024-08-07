//
//  UniversityListInteractor.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation

// Talk to presenter
protocol UniversityListInteractorProtocol {
    
    var presenter: UniversityListPresenterProtocol? { get set }
    
    func getUniversities()
}

class UniversityListInteractor: UniversityListInteractorProtocol {
    
    var presenter: UniversityListPresenterProtocol?
    let universityRepository: APICaller
    
    init() {
        let remoteDataSource = RemoteUniversityDataSource()
        let localDataSource = LocalDataHandler()
        self.universityRepository = UniversityDataHandler(remoteDataSource: remoteDataSource, localDataSource: localDataSource) 
    }
    
    func getUniversities() {
        universityRepository.fetchUniversities { result in
            switch result {
            case .success(let universities):
                self.presenter?.interactorWithData(result: .success(universities))
            case .failure(let failure):
                self.presenter?.interactorWithData(result: .failure(failure))
            }
        }
    }
    
}
