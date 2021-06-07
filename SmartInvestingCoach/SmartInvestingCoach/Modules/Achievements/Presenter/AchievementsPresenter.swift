//
//  AchievementsPresenter.swift
//  SmartInvestingCoach
//
//  Created by SaravanaKumaran Sakthivel on 06/06/21.
//

import Foundation


class AchievementsPresenter: AnyPresenter {
    var router: AnyRouter?
    var interactor: AnyInteractor?
    var view: AnyView?
        
    func interactorDidFetchAchievements(with result: Result<AchievementsResult, Error>) {
        
    }

    
}
