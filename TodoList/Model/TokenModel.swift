//
//  TokenModel.swift
//  TodoList
//
//  Created by Никита Коголенок on 13.09.22.
//

import Foundation

// MARK: - SignUpUserModel
struct SignUpUserModel: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let userID:       String
    let accessToken:  String
    let tokenType:    String
    let refreshToken: String
    let expiresIn:    Int

    enum CodingKeys: String, CodingKey {
        case userID       = "user_id"
        case accessToken  = "access_token"
        case tokenType    = "token_type"
        case refreshToken = "refresh_token"
        case expiresIn    = "expires_in"
    }
}
