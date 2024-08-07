//
//  UniversityDetailRouter.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation

protocol UniversityDetailRouterProtocol {
    var entry: UniversityDetailVC? { get set }
    static func createDetails(with university: University) -> UniversityDetailRouterProtocol
}

class UniversityDetailRouter: UniversityDetailRouterProtocol {
    
    var entry: UniversityDetailVC?
    
    static func createDetails(with university: University) -> UniversityDetailRouterProtocol {
        let router = UniversityDetailRouter()
        let view = UniversityDetailVC()
        let presenter = UniversityDetailPresenter()
        let interactor = UniversityDetailInteractor()
        
        // view's presenter
        view.presenter = presenter
        
        /// presenter's
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
//        // interactor's
        interactor.presenter = presenter
        interactor.university = university
        
        // router's
        router.entry = view
        return router
    }
}
