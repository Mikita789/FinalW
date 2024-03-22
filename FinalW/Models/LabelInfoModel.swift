//
//  LabelInfoModel.swift
//  FinalW
//
//  Created by Никита Попов on 22.03.24.
//

import Foundation

struct LabelInfo: Codable {
    let copyright: Copyright
}

// MARK: - Copyright
struct Copyright: Codable {
    let text: String
    let url: String
}
