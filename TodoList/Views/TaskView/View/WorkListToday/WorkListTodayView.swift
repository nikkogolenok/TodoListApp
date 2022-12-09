//
//  WorkListTodayView.swift
//  TodoList
//
//  Created by Никита Коголенок on 5.12.22.
//

import SwiftUI

struct WorkListTodayView: View {
    @StateObject var viewModel = TaskViewModel()
    let date = Date()
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            Spacer()
            Text("Today, " + date.formatted(.dateTime.day().month()) + "/" + date.formatted(.dateTime.year()))
                .textCase(.uppercase)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 14))
                .foregroundColor(FontStyleColors.colorSquareBlack)
                .padding(.horizontal)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 0) {
                    ForEach(viewModel.items) { item in
                        TasksView(task: $viewModel.items[getIndex(tasks: item)], tasks: $viewModel.items)
                    }
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

struct WorkListTodayView_Previews: PreviewProvider {
    static var previews: some View {
        WorkListTodayView()
    }
}
