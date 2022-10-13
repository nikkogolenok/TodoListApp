//
//  RemoteService.swift
//  TodoList
//
//  Created by Никита Коголенок on 27.09.22.
//

import Foundation
import Combine

struct RemoteService {
    static let apiClient = ApiClient()
}

enum ApiPath: String {
    case singUp       = "sign-up"
    case singIn       = "sing-in"
    case singOut      = "sing-out"
    case refreshToken = "refresh-token"
}

// MARK: - extension RemoteService
extension RemoteService {
    
    // MARK: - Methods
    
    // MARK: signUp
    static func signUp(useCase: SignUpUseCase) -> AnyPublisher<SignUpUserDataModel, Error > {
        guard let formData = try? JSONEncoder().encode(useCase) else { fatalError("Error") }
        
        let request = ApiService.request(.singUp, method: .post, formData: formData)
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    // MARK: signIn
    static func signIn(useCase: SignInUseCase) -> AnyPublisher<SignInUserDataModel, Error> {
        let token = ""
        guard let formData = try? JSONEncoder().encode(useCase) else { fatalError("Error") }
        
        let request = ApiService.request(.singIn, method: .post, token: token, formData: formData)
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    // MARK: refreshToken
    static func refreshToken(useCase: RefreshTokenUseCase) -> AnyPublisher<RefreshTokenDataModel, Error> {
        let token = ""
        let refreshToken = "a"
        guard let formData = try? JSONEncoder().encode(refreshToken) else { fatalError("Error") }
        
        let request = ApiService.request(.refreshToken, method: .post, token: token, formData: formData)
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
    
    // MARK: signOut
    static func signOut(useCase: SignOutUseCase) -> AnyPublisher<SignOutUserDataModel, Error> {
        let token = "a"
        guard let formData = try? JSONEncoder().encode(useCase) else {
            fatalError("Error")
        }
        let request = ApiService.request(.singOut, method: .post, token: token, formData: formData)
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
