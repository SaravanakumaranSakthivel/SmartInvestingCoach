//
//  AchievementsInteractor.swift
//  SmartInvestingCoach
//
//  Created by SaravanaKumaran Sakthivel on 06/06/21.
//

import Foundation


class AchievementsInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getAchievements() {
        if let achivementsData = self.readAchivementsJSON() {
            do {
                let achievementsResult = try JSONDecoder().decode(AchievementsResult.self, from: achivementsData)
                if achievementsResult.success ?? false {
                    self.presenter?.interactorDidFetchAchievements(with: .success(achievementsResult))
                }else {
                    self.presenter?.interactorDidFetchAchievements(with: .failure(FetchError.failed))
                }
            }catch {
                self.presenter?.interactorDidFetchAchievements(with: .failure(FetchError.parsingError))
            }
        }
    }
    
    private func readAchivementsJSON() -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "achievements",
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            self.presenter?.interactorDidFetchAchievements(with: .failure(FetchError.noData))
        }
        return nil
    }
    
}

