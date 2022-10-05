//
//  QuickView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.09.22.
//

import SwiftUI

struct QuickView: View {
    
    @StateObject var viewModel = TaskViewModel()
    
    var body: some View {
//        Text("Quick")
        tasksView()
        
            .offset(y: 20)
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Quick Notes")
            .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
            .foregroundColor(.white)
    }
    
    func tasksView() -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 0) {
                ForEach(viewModel.items) { item in
                    TasksView(task: $viewModel.items[getIndex(tasks: item)], tasks: $viewModel.items)
                }
            }
        }
    }
    
    func getIndex(tasks: TaskModel) -> Int {
        return viewModel.items.firstIndex { (task1) -> Bool in
            return tasks.id == task1.id
        } ?? 0
    }
}

struct QuickView_Previews: PreviewProvider {
    static var previews: some View {
        QuickView()
    }
}
