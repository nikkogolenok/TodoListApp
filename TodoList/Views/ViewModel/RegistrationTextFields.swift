//
//  RegistrationTextFields.swift
//  TodoList
//
//  Created by Никита Коголенок on 28.09.22.
//

import SwiftUI

struct RegistrationTextFields: View {
    
    @State var emailTextField = ""
    @State var passwordTextField = ""
    
    let titleUser: String
    let textFieldUser: String
    let titlePassword: String
    let textFieldPassword: String
    
    let top: CGFloat
    let leading: CGFloat
    let bottom: CGFloat
    let trailing: CGFloat
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(titleUser)
                .font(.custom(FontsStyleManager.Roboto.medium, size: 20))
            
            TextField(textFieldUser, text: $emailTextField)
                .keyboardType(.emailAddress)
            
            Rectangle()
                .frame(width: 326, height: 1)
                .foregroundColor(.gray)
        }
        .padding(.init(top: 26, leading: 24, bottom: 17, trailing: 0))
        
        
        VStack(alignment: .leading) {
            Text(titlePassword)
                .font(.custom(FontsStyleManager.Roboto.medium, size: 20))
            SecureField(textFieldPassword, text: $passwordTextField)
            
            Rectangle()
                .frame(width: 326, height: 1)
                .foregroundColor(.gray)
        }
        .padding(.init(top: top, leading: leading, bottom: bottom, trailing: trailing))
    }
}
