//
//  OnboardView.swift
//  TodoList
//
//  Created by Никита Коголенок on 28.09.22.
//

import SwiftUI

struct OnboardView: View {
    
    // MARK: - Variables
    @State private var navigate = false
    
    let imageName: String
    let title: String
    let description: String
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            Image(imageName)
                .frame(width: 305, height: 252)
                .padding(.init(top: 108, leading: 35, bottom: 0, trailing: 35))
                .ignoresSafeArea()
            Spacer()
            Text(title)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 24))
                .foregroundColor(FontStyleColors.colorThin)
                .padding(.init(top: 0, leading: 0, bottom: 11, trailing: 0))
            
            Text(description)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 19))
                .foregroundColor(FontStyleColors.colorMedium)
                .opacity(0.8)
            Spacer()
        }
        .offset(y: -50)
    }
}
