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

extension RemoteService {
    static func signUp(useCase: SignUpUseCase) -> AnyPublisher<SignUpUserModel, Error> {
        guard let formData = try? JSONEncoder().encode(useCase)
        else { fatalError("Error") }
        
        let request = ApiService.request(.singUp, method: .post, formData: formData)
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
