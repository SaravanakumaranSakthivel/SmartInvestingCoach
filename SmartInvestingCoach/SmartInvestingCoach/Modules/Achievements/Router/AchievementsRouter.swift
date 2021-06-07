//
//  AchievementsRouter.swift
//  SmartInvestingCoach
//
//  Created by SaravanaKumaran Sakthivel on 06/06/21.
//

import Foundation
import UIKit

class AchievementsRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = AchievementsRouter()
        
        // Assign View, Interactor and Presenter
        
        var view: AnyView = AchievementsViewController()
        var presenter: AnyPresenter = AchievementsPresenter()
        var interactor: AnyInteractor = AchievementsInteractor()

        view.presenter = presenter
        interactor.presenter = presenter

        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
                
        router.entry = view as? EntryPoint
        return router
    }
    
    
    
}
