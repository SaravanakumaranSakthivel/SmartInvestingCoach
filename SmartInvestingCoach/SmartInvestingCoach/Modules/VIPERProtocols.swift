//
//  VIPERProtocols.swift
//  SmartInvestingCoach
//
//  Created by SaravanaKumaran Sakthivel on 06/06/21.
//

import Foundation
import UIKit

typealias EntryPoint = UIViewController
protocol  AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}

/*
  Any presenter should contain reference to Interactor, Router and View
 */
protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchAchievements(with result: Result<AchievementsResult, Error>)
}

/*
    Any interacter should contain a reference to presenter to communicate back to presenter.
 */
protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    func getAchievements()
}

/*
  View should have reference to presenter
 */
protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    func updateAchievements(with title: String, achievements: [Achievement])
    func updateAchievements(with error: String)
}
