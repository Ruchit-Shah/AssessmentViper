//
//  UniversityListPresenter.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation


protocol UniversityListPresenterProtocol {
    
    var router: UniversityListRouterProtocol? { get set }
    var view: UniversityListViewProtocol? { get set }
    var interactor: UniversityListInteractorProtocol? { get set }
    
    func viewDidLoad()
    func interactorWithData(result: Result<Universities, Error>)
    func tapOnDetail(_ university: University)
    
}

class UniversityListPresenter: UniversityListPresenterProtocol {
    
    var router: UniversityListRouterProtocol?
    var view: UniversityListViewProtocol?
    var interactor: UniversityListInteractorProtocol?
    
    func viewDidLoad() {
        interactor?.getUniversities()
    }
    
    func interactorWithData(result: Result<Universities, Error>) {
        
        switch result {
        case .success(let universities):
            print(universities)
            view?.update(with: universities)
        case .failure(let error):
            print(error)
            view?.update(with: "Something went wrong !!")
        }
    }
    
    func tapOnDetail(_ university: University) {
        router?.goToDetailView(university: university)
    }
}
