//
//  SingOutUserModel.swift
//  TodoList
//
//  Created by Никита Коголенок on 13.10.22.
//

import Foundation

// MARK: - SingOutUserDataModel
struct SignOutUserDataModel: Codable {
    let data: SignOutUserModel
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

// MARK: - SingOutUserModel
struct SignOutUserModel: Codable {
    let success: String
    
    enum CodingKeys: String, CodingKey {
        case success
    }
}
