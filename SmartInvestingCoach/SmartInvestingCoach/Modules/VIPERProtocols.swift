//
//  VIPERProtocols.swift
//  SmartInvestingCoach
//
//  Created by SaravanaKumaran Sakthivel on 06/06/21.
//

import Foundation
import UIKit

typealias EntryPoint = UIViewController

/*
 Generic Router
 start() : Helps to define a entry point.
 */
protocol  AnyRouter {
    var entry: EntryPoint? { get }
    // This defines the rootviewcontroller.
    static func start() -> AnyRouter
}


// Any presenter should contain reference to Interactor, Router and View

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    
    //  This will get called once the data has been fetched from interactor to the presenter.
    func interactorDidFetchAchievements(with result: Result<AchievementsResult, FetchError>)
}


//  Any interacter should contain a reference to presenter to communicate back to presenter.
protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    
    //  This method helps to fetch achievements from the local json file.
    func getAchievements()
}


//  View should have reference to presenter
protocol AnyView {
    var presenter: AnyPresenter? { get set }
    
    //  This methods helps to update view with the valid achievements.
    func updateAchievements(with title: String, achievements: [Achievement])
    //  This methods helps to update view for error state.
    func updateAchievements(with error: FetchError)
}
