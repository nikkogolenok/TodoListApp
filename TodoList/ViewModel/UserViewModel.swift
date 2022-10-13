//
//  UserViewModel.swift
//  TodoList
//
//  Created by Никита Коголенок on 13.09.22.
//

import Foundation
import Combine
import CoreData


class UserViewModel: ObservableObject {
    
    // MARK: - Variables
    @Published var isLoading:    Bool   = false
    @Published var isError:      Bool   = false
    @Published var errorMessage: String = ""
    var cancellabToken:          AnyCancellable?
}

// MARK: - Extension UserViewModel
extension UserViewModel {
    
    // MARK: - Methods
    
    // MARK: signUp
    func signUp(username: String, email: String, password: String) {
        self.isLoading.toggle()
        let formData = SignUpUseCase(username: username, email: email, password: password)
        cancellabToken = RemoteService.signUp(useCase: formData)
            .mapError({(error) -> Error in
                self.isLoading.toggle()
                print(error)
                return error
            })
        
            .sink(receiveCompletion: { _ in }, receiveValue: { value in
                self.isLoading.toggle()
                print(value)
            })
    }
    
    // MARK: signIn
    func signIn(email: String, password: String) {
        self.isLoading.toggle()
        let formDate = SignInUseCase(email: email, password: password)
        cancellabToken = RemoteService.signIn(useCase: formDate)
            .mapError({(error) -> Error in
                self.isLoading.toggle()
                print(error)
                return error
            })
        
            .sink(receiveCompletion: { _ in }, receiveValue: { value in
                self.isLoading.toggle()
                print(value)
            })
    }
    
    // MARK: refreshToken
    func refreshToken(refresh_token: String) {
        let formDate = RefreshTokenUseCase(refresh_token: refresh_token)
        cancellabToken = RemoteService.refreshToken(useCase: formDate)
            .mapError({(error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { value in
                print(value)
            })
    }
    
    // MARK: singOut
    func singOut(email: String) {
        let formDate = SignOutUseCase(email: email)
        cancellabToken = RemoteService.signOut(useCase: formDate)
            .mapError({(error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in }, receiveValue: { value in
                print(value)
            })
    }
}
