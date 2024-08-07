//
//  UniversityDetailInteractor.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation

protocol UniversityDetailInteractorProtocol {
    
    var presenter: UniversityDetailPresenterProtocol? { get set }
    var university: University? { get set }
    
    func getUniversityData()
}

class UniversityDetailInteractor: UniversityDetailInteractorProtocol {
    
    var presenter: UniversityDetailPresenterProtocol?
    var university: University?
    
    func getUniversityData() {
        presenter?.interactorUpdateData(university: university)
    }

}
