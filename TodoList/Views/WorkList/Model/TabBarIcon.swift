//
//  TabBarIcon.swift
//  TodoList
//
//  Created by Никита Коголенок on 15.09.22.
//

import SwiftUI

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let systemIconName, tabName: String
    
    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .padding(.horizontal, -5)
        .foregroundColor(viewRouter.currentPage == assignedPage ? Color.white : .gray)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
    }
}
