//
//  TwoNavigationLink.swift
//  TodoList
//
//  Created by Никита Коголенок on 28.09.22.
//

import SwiftUI

struct TwoNavigationLink: View {
    
    @StateObject var viewRouter = ViewRouter()
    let titleLinkOne: String
    let titleLinkTwo: String
    
    let spacing : CGFloat
    let top: CGFloat
    let leading: CGFloat
    let bottom: CGFloat
    let trailing: CGFloat
    
    var body: some View {
        VStack(alignment: .center, spacing: spacing) {
            NavigationLink(titleLinkOne) {
                SignInView()
            }
            .font(.custom(FontsStyleManager.Roboto.thin, size: 21))
            .frame(width: 327, height: 48)
            .background(FontStyleColors.colorRed)
            .foregroundColor(FontStyleColors.colorWhite)
            .cornerRadius(5)
            
            NavigationLink(titleLinkTwo) {
                WorkListView(viewRouter: viewRouter)
            }
            .frame(width: 60, height: 21)
            .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
            .foregroundColor(FontStyleColors.colorRed)
        }
        .padding(.init(top: top, leading: leading, bottom: bottom, trailing: trailing))
    }
}
