//
//  TaskAllModel.swift
//  TodoList
//
//  Created by Никита Коголенок on 13.10.22.
//

import Foundation
import SwiftUI

struct TaskAllModel: Identifiable, Equatable {
    var id: String = UUID().uuidString
    var taskName: String
    
    
}
