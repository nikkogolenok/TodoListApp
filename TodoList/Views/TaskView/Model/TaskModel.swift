//
//  TaskModel.swift
//  TodoList
//
//  Created by Никита Коголенок on 29.09.22.
//

import SwiftUI

struct TaskModel: Identifiable {
    var id = UUID().uuidString
    var task: String
    var time: String
    var offset: CGFloat
    var isCompleted: Bool
    var isSwipped: Bool
}
