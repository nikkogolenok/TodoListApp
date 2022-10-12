//
//  TabBarView.swift
//  TodoList
//
//  Created by Никита Коголенок on 11.10.22.
//

import SwiftUI

struct TabBarView: View {
    
    // MARK: - Variables
    @StateObject var viewRouter: ViewRouter
    @State var showCreatMenu: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
//                    switch viewRouter.currentPage {
//                    case .myTask:
//                        TaskView()
//                    case .menu:
//                        MenuView()
//                    case .quick:
//                        QuickView()
//                    case .profile:
//                        ProfileView()
//                    }
                    
                    
                    ZStack {
                        HStack {
                            
                            let geometryWidth: CGFloat = geometry.size.width/5
                            let geometryHeight: CGFloat = geometry.size.width/15
                            
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .myTask, width: geometryWidth, height: geometryHeight, systemIconName: "checkmark.circle.fill", tabName: "My Task")
                            
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .menu, width: geometryWidth, height: geometryHeight, systemIconName: "square.grid.2x2.fill", tabName: "Menu")
                            
                            ZStack {
                                Circle()
                                    .fill(.linearGradient(Gradient(colors: showCreatMenu ? [.red] : [Color(red: 246/255, green: 136/255, blue: 136/255),
                                                                                                     Color(red: 249/255, green: 96/255, blue: 96/255)]), startPoint: .leading, endPoint: .trailing))
                                    .frame(width: 70, height: 70)
                                Image(systemName: "plus")
                                    .resizable()
                                    .foregroundStyle(.white)
                                    .frame(width: 20, height: 20)
                                    .rotationEffect(Angle(degrees: showCreatMenu ? 135 : 0))
                            }
                            .offset(y: -geometry.size.height/8/4)
                            .onTapGesture {
                                withAnimation {
                                    self.showCreatMenu.toggle()
                                }
                            }
                            
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .quick, width: geometryWidth, height: geometryHeight, systemIconName: "list.bullet.rectangle.portrait.fill", tabName: "Quick")
                            
                            TabBarIcon(viewRouter: viewRouter, assignedPage: .profile, width: geometryWidth, height: geometryHeight, systemIconName: "person.fill", tabName: "Profile")
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height/8)
                        .background(FontStyleColors.colorBar)
                    }
                }
            }
            
        }
//        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(viewRouter: ViewRouter())
    }
}
