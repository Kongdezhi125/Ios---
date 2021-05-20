//
//  History.swift
//  History Today
//
//  Created by 马李军 on 2021/4/8.
//

import Foundation

struct HistoryModels: Codable {
    let reason: String
    let result: [History]
    let error_code: Int
    }

// MARK: - Result
struct History: Codable {
    let day, date, title, e_id: String

}
