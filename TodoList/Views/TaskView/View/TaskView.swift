//
//  TaskView.swift
//  TodoList
//
//  Created by Никита Коголенок on 5.10.22.
//

import SwiftUI

struct TaskView: View {
    
    // MARK: - Variables
    @State var currentButton: Bool = true
    @State var filterButton:  Bool = false
    @State var chachImage: Bool = false
    @StateObject var viewModel = TaskViewModel()
    
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
                            Image(systemName: chachImage ? "chevron.up" : "chevron.down")
                        }
                        .onTapGesture {
                            if !chachImage {
                                self.chachImage.toggle()
                            }
                        }
                        sectionView()
                        
                        if chachImage {
                           CalendarWonthView()
                        }
                        tasksView()
                    }
                } header: {
                    headerView()
                }
            }
        }
        .ignoresSafeArea(.container, edges: .top)
    }
    
    // MARK: - Methods
    
    // MARK: Section
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
    
    // MARK: Header
    func headerView() -> some View {
        
        ZStack {
            VStack {
                VStack {
                    HStack(spacing: 100) {
                        Spacer()
                        Text("Work List")
                            .foregroundColor(.white)

                        Image(systemName: "slider.horizontal.3")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 21)
                            .padding(.trailing, 28)
                            .onTapGesture {
                                self.filterButton.toggle()
                            }
                    }
                    .padding(.top, 25)

                    HStack {
                        Text("Today")
//                        NavigationLink("Today") {
//                            TodayView()
//                        }
                            .padding(.trailing, 120)
                            .foregroundColor(Color(white: 1, opacity: currentButton ? 1 : 0.5))

                            .onTapGesture {
                                if !self.currentButton {
                                    self.currentButton.toggle()
                                }
                            }

                        Text("Month")
                            .foregroundColor(Color(white: 1, opacity: currentButton ? 0.5 : 1))

                            .onTapGesture {
                                if self.currentButton {
                                    self.currentButton.toggle()
                                }
                            }
                    }
                    .padding(.top, 18)
                    Rectangle()
                        .frame(width: 96, height: 3)
                        .foregroundColor(.white)
                        .padding(currentButton ? .trailing : .leading, currentButton ? 180 : 190)
                }
            }

            if filterButton {
                GeometryReader { _ in
                    AlertFilterView(firstText: "Incomplete Tasks", secondText: "Completd Tasks", thirdText: "All Tasks")
                        .cornerRadius(5)
                        .padding(.leading, 120)
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
        .padding()
        .padding(.top, getSafeArea().top)
        .background(FontStyleColors.colorRed)
        .navigationBarHidden(true)
    }
    
    // MARK: TaskView
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

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}

// MARK: - UI Design Helper functions
extension View {
    
    func hLeading() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }

    func hCenter() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .center)
    }
    
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return .zero }
        
        guard let safeArea = screen.windows.first?.safeAreaInsets else { return .zero}
        
        return safeArea
    }
}

