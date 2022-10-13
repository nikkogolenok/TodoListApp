//
//  SingUpUserModel.swift
//  TodoList
//
//  Created by Никита Коголенок on 13.10.22.
//

import Foundation

// MARK: - SignUpUserDataModel
struct SignUpUserDataModel: Codable {
    let data: SignUpUserModel
    
    enum CodingKeys: String, CodingKey {
        case data
    }
}

// MARK: - SingUpUserModel
struct SignUpUserModel: Codable {
    let id:           String
    let email:        String
    let username:     String
    let avatar_url:   String?
    let user_session: UserSession
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case username
        case avatar_url
        case user_session
    }
}

// MARK: - UserSession
struct UserSession: Codable {
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
