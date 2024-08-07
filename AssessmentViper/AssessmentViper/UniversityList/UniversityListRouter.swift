//
//  UniversityListRouter.swift
//  AssessmentViper
//
//  Created by Ruchit on 07/08/24.
//

import Foundation


protocol UniversityListRouterProtocol {
    
    var entry: UniversityListVC? { get }
    static func start() -> UniversityListRouterProtocol
    
    func goToDetailView(university: University)
}

class UniversityListRouter: UniversityListRouterProtocol {
    
    var entry: UniversityListVC?
    
    static func start() -> UniversityListRouterProtocol {
        
        let router = UniversityListRouter()
        let view = UniversityListVC()
        let presenter = UniversityListPresenter()
        let interactor = UniversityListInteractor()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.entry = view
        return router
    }
    
    func goToDetailView(university: University) {
        let detailsRouter = UniversityDetailRouter.createDetails(with: university)
        guard let detailView = detailsRouter.entry else { return }
        guard let viewController = self.entry else { return }
        viewController.navigationController?.pushViewController(detailView, animated: true)
    }
    
}
