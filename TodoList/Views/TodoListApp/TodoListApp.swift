//
//  TodoListApp.swift
//  TodoList
//
//  Created by Никита Коголенок on 16.08.22.
//

import SwiftUI

@main
struct TodoListApp: App {
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
            //WorkListView(viewRouter: viewRouter)
        }
    }
}
