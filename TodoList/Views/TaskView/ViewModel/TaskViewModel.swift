//
//  TaskViewModel.swift
//  TodoList
//
//  Created by Никита Коголенок on 29.09.22.
//

import SwiftUI

class TaskViewModel: ObservableObject {
   @Published var items: [TaskModel] = [
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false),
        TaskModel(task: "Read the book Zlatan", time: "12:30 am", offset: 0, isCompleted: false, isSwipped: false)
    ]
}

