//
//  SuccesfulView.swift
//  TodoList
//
//  Created by Никита Коголенок on 19.08.22.
//

import SwiftUI

struct SuccesfulView: View {
    var body: some View {
        VStack(spacing: 0) {
            Image("succesful")
                .frame(width: 162, height: 170)
                .padding(.init(top: 10, leading: 107, bottom: 40, trailing: 106))
            
            Text("Succesful!")
                .font(.custom(FontsStyleManager.Roboto.thin, size: 32))
                .foregroundColor(FontsStyleManager.Roboto.colorThin)
                .padding(.init(top: 0, leading: 113, bottom: 10, trailing: 113))
            
            Text("You have succesfully change password. Please use your new passwords when logging in.")
                .frame(width: 330, height: 57)
                .font(.custom(FontsStyleManager.Roboto.medium, size: 16))
                .foregroundColor(FontsStyleManager.Roboto.colorThin)
                .multilineTextAlignment(.center)
                .padding(.init(top: 0, leading: 23, bottom: 0, trailing: 22))
        }
    }
}

struct SuccesfulView_Previews: PreviewProvider {
    static var previews: some View {
        SuccesfulView()
    }
}

