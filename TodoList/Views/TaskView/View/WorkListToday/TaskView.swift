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
    @State var changeImage: Bool = false
    @StateObject var viewModel = TaskViewModel()
    @State var selectedIndex = 0
    let date = Date()
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            // MARK: Lazy Stack With Pinned Header
            LazyVStack(spacing: 5, pinnedViews: [.sectionHeaders]) {
                VStack {
                    headerView()
                    
                    switch selectedIndex {
                    case 0: WorkListTodayView()
                    case 1: WorkListMonthView()
                    default: WorkListTodayView()
                    }
                    
                    
                    
                }
            }
        }
        .ignoresSafeArea(.container, edges: .top)
    }
    // MARK: - Methods
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
                            .padding(.trailing, 120)
                            .foregroundColor(Color(white: 1, opacity: currentButton ? 1 : 0.5))
                        
                            .onTapGesture {
                                if !self.currentButton {
                                    self.selectedIndex = 0
                                    self.currentButton.toggle()
                                }
                            }
                        
                        Text("Month")
                            .foregroundColor(Color(white: 1, opacity: currentButton ? 0.5 : 1))
                        
                            .onTapGesture {
                                if self.currentButton {
                                    self.selectedIndex = 1
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
                .ignoresSafeArea()
            }
        }
        .padding()
        .padding(.top, getSafeArea().top)
        .background(FontStyleColors.colorRed)
        .navigationBarHidden(true)
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

