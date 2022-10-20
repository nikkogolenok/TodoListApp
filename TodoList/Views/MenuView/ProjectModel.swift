//
//  ProjectModel.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.10.22.
//

import Foundation
import SwiftUI


struct ProjectModel: Identifiable, Codable {
    
    var id = UUID()
    var color: TapToColors = .white
    var nameProject: String = ""
    var tasks: [TaskModel] = []
}


struct projectSave: Codable {
    
    let name: String
    let surname: String
    
}
