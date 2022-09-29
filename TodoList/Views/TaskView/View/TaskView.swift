//
//  TaskView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.09.22.
//

import SwiftUI

struct TaskView: View {
    
    // MARK: - Variables
    @State var currentButton: Bool = true
    @State var filterButton:  Bool = false
    @StateObject var viewModel = TaskViewModel()
    
    var body: some View {
        
        ZStack {
            VStack {
                VStack {
                    HStack(spacing: 115) {
                        Spacer()
                        Text("Work List")
                            .font(.custom(FontsStyleManager.Roboto.thin, size: 20))
                            .foregroundColor(FontStyleColors.colorWhite)
                        
                        Image(systemName: "slider.horizontal.3")
                            .resizable()
                            .foregroundColor(FontStyleColors.colorWhite)
                            .frame(width: 20, height: 21)
                            .padding(.trailing, 28)
                            .onTapGesture {
                                self.filterButton.toggle()
                            }
                    }
                    .padding(.top, 25)
                    
                    HStack {
                        Text("Today")
                            .padding(.trailing, 135)
                            .foregroundColor(Color(white: 1, opacity: currentButton ? 1 : 0.5))
                            .font(.custom(FontsStyleManager.Roboto.medium, size: 18))
                            .onTapGesture {
                                if !self.currentButton {
                                    self.currentButton.toggle()
                                }
                            }
                        
                        Text("Month")
                            .foregroundColor(Color(white: 1, opacity: currentButton ? 0.5 : 1))
                            .font(.custom(FontsStyleManager.Roboto.medium, size: 18))
                            .onTapGesture {
                                if self.currentButton {
                                    self.currentButton.toggle()
                                }
                            }
                    }
                    .padding(.top, 18)
                    Rectangle()
                        .frame(width: 96, height: 3)
                        .foregroundColor(FontStyleColors.colorWhite)
                        .padding(currentButton ? .trailing : .leading, currentButton ? 210 : 205)
                }
                .background(FontStyleColors.colorRed)
                .frame(height: 151)
                .offset(y: -40)
                Spacer()
    
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.items) { item in
                            TasksView(task: $viewModel.items[getIndex(tasks: item)], tasks: $viewModel.items)
                            
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            
            if filterButton {
                GeometryReader { _ in
                    AlertFilterView()
                        .cornerRadius(5)
                        .padding(.leading,145)
                        .padding(.top, 30)
                }
                .background(
                    Color.black.opacity(0.65)
                        .onTapGesture {
                            withAnimation {
                                self.filterButton.toggle()
                            }
                        }
                )
                
            }
        }
    }
    
    // MARK: - Method
    func getIndex(tasks: TaskModel) -> Int {
        return viewModel.items.firstIndex { (task1) -> Bool in
            return tasks.id == task1.id
        } ?? 0
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
