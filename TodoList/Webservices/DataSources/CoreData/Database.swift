//
//  Database.swift
//  TodoList
//
//  Created by Никита Коголенок on 26.10.22.
//

import Foundation
import CoreData

struct Database {
    
    func insertUser(context: NSManagedObjectContext, userModel: SignUpUserModel) {
        
        let userData = userModel
        
        let newUser = User(context: context)
        newUser.id = userData.id
        newUser.email = userData.email
        newUser.name = userData.username
        newUser.token = userData.user_session.access_token
        
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func deleteUser(context: NSManagedObjectContext, user: User) {
        do {
            context.delete(user)
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
