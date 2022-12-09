//
//  PersonModel.swift
//  TodoList
//
//  Created by Никита Коголенок on 7.12.22.
//

import Foundation

struct PersonModel: Identifiable, Codable {
    var id = UUID()
    let name: String
    let surname: String
    let imageName: String
    let email: String
}
