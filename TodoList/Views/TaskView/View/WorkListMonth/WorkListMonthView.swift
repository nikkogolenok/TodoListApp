//
//  WorkListMonthView.swift
//  TodoList
//
//  Created by Никита Коголенок on 5.12.22.
//

import SwiftUI

struct WorkListMonthView: View {
    
    @StateObject var viewModel = TaskViewModel()
    @State var changeImage: Bool = false
    let date = Date()
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            // MARK: Lazy Stack With Pinned Header
            LazyVStack(spacing: 5, pinnedViews: [.sectionHeaders]) {
                Section {
                    VStack {
                        
                        HStack(spacing: 2) {
                            let day = viewModel.currentDay
                            Text(viewModel.extractDate(date: day, format: "MMMM YYYY"))
                            //Image(systemName: changeImage ? "chevron.up" : "chevron.down")
                            Image(systemName: "chevron.down")
                        }
                        .onTapGesture {
//                            if !changeImage {
//                                self.changeImage.toggle()
//                            }
                        }
                        sectionView()
                        
                        if changeImage {
                            CalendarWonthView()
                        }
                        tasksView()
                    }
                } header: {
                    //headerView()
                }
            }
        }
        .padding(.top, 10)
        .ignoresSafeArea(.container, edges: .top)
    }
    
    func sectionView() -> some View {
        // MARK: Current Week View
        //        ScrollView(.horizontal, showsIndicators: false) {
        
        VStack {
            HStack(spacing: 10) {
                
                ForEach(viewModel.currentWeek, id: \.self) { day in
                    
                    VStack(spacing: 10) {
                        
                        // EEE will return day as Mon, Tue
                        Text(viewModel.extractDate(date: day, format: "EEE"))
                            .font(.system(size: 14))
                            .fontWeight(.semibold)
                        
                        Text(viewModel.extractDate(date: day, format: "dd"))
                            .font(.system(size: 15))
                        
                        Circle()
                            .fill(.gray)
                            .frame(width: 8, height: 8)
                            .opacity(viewModel.isToday(date: day) ? 1 : 0)
                    }
                    //.foregroundStyle(viewModel.isToday(date: day) ? .gray : .white)
                    .foregroundColor(viewModel.isToday(date: day) ? .gray : .black)
                    // MARK: Capsule Shape
                    .frame(width: 45, height: 90)
                    .contentShape(Capsule())
                    .onTapGesture {
                        withAnimation {
                            viewModel.currentDay = day
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    func tasksView() -> some View {
        
        
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

struct WorkListMonthView_Previews: PreviewProvider {
    static var previews: some View {
        WorkListMonthView()
    }
}
