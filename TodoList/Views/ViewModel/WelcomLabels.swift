//
//  WelcomLabels.swift
//  TodoList
//
//  Created by Никита Коголенок on 28.09.22.
//

import SwiftUI

struct WelcomLabels: View {
    
    let title: String
    let subTitle: String
    let top: CGFloat
    let leading: CGFloat
    let bottom: CGFloat
    let trailing: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                //.padding(.init(top: 94, leading: 0, bottom: 0, trailing: 224))
                .font(.custom(FontsStyleManager.Roboto.thin, size: 32))
                .foregroundColor(FontStyleColors.colorThin)
            Text(subTitle)
                //.padding(.init(top: 12, leading: 0, bottom: 0, trailing: 213))
                .font(.custom(FontsStyleManager.Roboto.thin, size: 16))
                .foregroundColor(FontStyleColors.colorMedium)
        }
        .padding(.init(top: top, leading: leading, bottom: bottom, trailing: trailing))
    }
}
