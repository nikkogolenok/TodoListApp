//
//  QuickViewModel.swift
//  TodoList
//
//  Created by Никита Коголенок on 21.10.22.
//

import SwiftUI

class QuickViewModel: ObservableObject {
    @Published var items: [QuickModel] = [
        QuickModel(task: "Meeting with Jessica in Central Park", color: .red),
        QuickModel(task: "Meeting with Jessica in Central Park", color: .green),
        QuickModel(task: "Meeting with", color: .blue)
    ]
}
