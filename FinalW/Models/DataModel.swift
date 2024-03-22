//
//  DataModel.swift
//  FinalW
//
//  Created by Никита Попов on 22.03.24.
//

import Foundation


struct DataModel: Codable {
    let event: String
    let schedule: [Schedule]
    
}

// MARK: - Schedule
struct Schedule: Codable {
    let thread: Thread
    let departure: String?
    let arrival: String?
    
}

// MARK: - Thread
struct Thread: Codable {
    let number, title, shortTitle: String
    let vehicle: String
    let uid: String

    enum CodingKeys: String, CodingKey {
        case number, title
        case shortTitle = "short_title"
        case vehicle
        case uid
    }
}
