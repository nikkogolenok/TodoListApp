//
//  RefreshTokenModel.swift
//  TodoList
//
//  Created by Никита Коголенок on 13.10.22.
//

import Foundation

// MARK: - RefreshTokenDataModel
struct RefreshTokenDataModel: Codable {
    let data: RefreshTokenModel
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

// MARK: - RefreshTokenModel
struct RefreshTokenModel: Codable {
    let user_id: String?
    let access_token: String
    let token_type: String
    let refresh_token: String
    let expires_in: Int

    enum CodingKeys: String, CodingKey {
        case user_id
        case access_token
        case token_type
        case refresh_token
        case expires_in
    }
}
