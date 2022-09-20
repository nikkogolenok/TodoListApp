//
//  WorkListView.swift
//  TodoList
//
//  Created by Никита Коголенок on 15.09.22.
//

import SwiftUI

struct WorkListView: View {
    
    // MARK: - Variables
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewRouter: ViewRouter
    @State var showPopUp = false
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
                Spacer()
                switch viewRouter.currentPage {
                case .myTask:
                    TaskView()
                case .menu:
                    MenuView()
                case .quick:
                    QuickView()
                case .profile:
                    ProfileView()
                }
                Spacer()
                
                HStack {
                    
                    let geometryWidth: CGFloat = geometry.size.width/5
                    let geometryHeight: CGFloat = geometry.size.width/15
                    
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .myTask, width: geometryWidth, height: geometryHeight, systemIconName: "checkmark.circle.fill", tabName: "My Task")
                    
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .menu, width: geometryWidth, height: geometryHeight, systemIconName: "square.grid.2x2.fill", tabName: "Menu")
                    
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: geometry.size.width/7, height: geometry.size.width/7)
                            .shadow(radius: 4)
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width/6, height: geometry.size.width/6)
                            .foregroundColor(FontStyleColors.colorRed)
                            .rotationEffect(Angle(degrees: showPopUp ? 90 : 0))
                    }
                    .offset(y: -geometry.size.height/8/2.5)
                    .onTapGesture {
                        withAnimation {
                            showPopUp.toggle()
                        }
                    }
                    
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .quick, width: geometryWidth, height: geometryHeight, systemIconName: "list.bullet.rectangle.portrait.fill", tabName: "Quick")
                    
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .profile, width: geometryWidth, height: geometryHeight, systemIconName: "person.fill", tabName: "Profile")
                }
                .frame(width: geometry.size.width, height: geometry.size.height/8)
                .background(FontStyleColors.colorBar.shadow(radius: 2))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct WorkListView_Previews: PreviewProvider {
    static var previews: some View {
        WorkListView(viewRouter: ViewRouter())
    }
}
