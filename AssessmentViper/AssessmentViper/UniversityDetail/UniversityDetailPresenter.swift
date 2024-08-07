//
//  UniversityDetailPresenter.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation

protocol UniversityDetailPresenterProtocol {
    
    var router: UniversityDetailRouterProtocol? { get set }
    var interactor: UniversityDetailInteractorProtocol? { get set }
    var view: UniversityDetailViewProtocol? { get set }
    
    func interactorUpdateData(university: University?)
    func viewDidLoad()
    
}

class UniversityDetailPresenter: UniversityDetailPresenterProtocol {
    
    var router: UniversityDetailRouterProtocol?
    var interactor: UniversityDetailInteractorProtocol?
    var view: UniversityDetailViewProtocol?
    
    func viewDidLoad() {
        interactor?.getUniversityData()
    }
    
    func interactorUpdateData(university: University?) {
        if let university = university {
            view?.update(with: university)
        } else {
            view?.update(with: "with no data")
        }
    }
    
}
