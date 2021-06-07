//
//  AchievementsEntity.swift
//  SmartInvestingCoach
//
//  Created by SaravanaKumaran Sakthivel on 06/06/21.
//

import Foundation

/*
 "overview": {
   "title": "Smart Investing"
 },
 **/


struct AchievementsOverview: Codable {
    let title: String?
}


/*
 {
   "success": true,
   "status": 200,
   "overview": {
     "title": "Smart Investing"
   },
   "achievements": [
     {
 **/

struct AchievementsResult: Codable {
    
    let success: Bool?
    let status: Int?
    let overview: AchievementsOverview?
    let achievements: [Achievement]?
}


/*
 "id": 4,
 "level": "1",
 "progress": 10,
 "total": 50,
 "bg_image_url": "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/C850B103-B8C5-4518-8631-168BB42FFBBD.png",
 "accessible": true

 **/

struct Achievement: Codable {
    let id: Int?
    let level: String?
    let progress: Int?
    let total: Int?
    let bg_image_url: String?
    let accessible: Bool?
}
