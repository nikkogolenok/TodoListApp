//
//  ViewRouter.swift
//  TodoList
//
//  Created by Никита Коголенок on 15.09.22.
//

import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .myTask
}

enum Page {
    case myTask
    case menu
    case quick
    case profile
}
