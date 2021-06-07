//
//  AchievementsEntity.swift
//  SmartInvestingCoach
//
//  Created by SaravanaKumaran Sakthivel on 06/06/21.
//

import Foundation


struct AchievementsOverview: Codable {
    let title: String?
}

struct AchievementsResult: Codable {
    
    let success: Bool?
    let status: Int?
    let overview: AchievementsOverview?
    let achievements: [Achievement]?
}


struct Achievement: Codable {
    let id: Int?
    let level: String?
    let progress: Int?
    let total: Int?
    let bg_image_url: String?
    let accessible: Bool?
}
