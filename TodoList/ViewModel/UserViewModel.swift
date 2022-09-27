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
    @Published var isLoading:    Bool   = false
    @Published var errorMessage: String = ""
    @Published var isError:      Bool   = false
    
    var cancellabToken: AnyCancellable?
}

extension UserViewModel {
    
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
}
