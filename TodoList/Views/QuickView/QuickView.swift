//
//  QuickView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.09.22.
//

import SwiftUI

struct QuickView: View {
    
    // MARK: - Variable
    @StateObject var viewModel = QuickViewModel()
    
    // MARK: - Boby
    var body: some View {
        //        Text("Quick")
        //
        //            .offset(y: 20)
        //            .navigationBarBackButtonHidden(true)
        //            .navigationTitle("Quick Notes")
        //            .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
        //            .foregroundColor(.white)
        
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.items) { item in
                    QuicksView(quick: $viewModel.items[getIndex(tasks: item)], quicks: $viewModel.items)
                }
            }
        }
        
    }
    
    func getIndex(tasks: QuickModel) -> Int {
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


//ForEach(viewModel.items) { item in
//    TasksView(task: $viewModel.items[getIndex(tasks: item)], tasks: $viewModel.items)
//}
