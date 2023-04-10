//
//  Posts.swift
//  GET Request
//
//  Created by Марк Фокша on 11.04.2023.
//

import Foundation

struct Posts: Codable {
    
    let title: String
    let body: String
    let userID: Int
    let ID: Int
    
    enum CodingKeys: String, CodingKey {
        
        case title
        case body
        case userID = "userId"
        case ID = "id"
    }
    
}
