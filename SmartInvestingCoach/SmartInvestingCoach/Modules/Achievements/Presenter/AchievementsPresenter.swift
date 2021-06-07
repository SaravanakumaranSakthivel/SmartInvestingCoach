//
//  AchievementsPresenter.swift
//  SmartInvestingCoach
//
//  Created by SaravanaKumaran Sakthivel on 06/06/21.
//

import Foundation

enum FetchError: Error {
    case failed
    case parsingError
    case noData
}

class AchievementsPresenter: AnyPresenter {
    
    var router: AnyRouter?
    var interactor: AnyInteractor? {
        didSet{
            interactor?.getAchievements()
       }
    }
    var view: AnyView?
    
 
    func interactorDidFetchAchievements(with result: Result<AchievementsResult, FetchError>) {
        switch result {
        case .success(let achievementsResult):
            view?.updateAchievements(with: achievementsResult.overview?.title ?? "",
                                     achievements: achievementsResult.achievements ?? [])
        case .failure(let error):
            view?.updateAchievements(with :error)
        }
        
    }

    
}
