//
//  SignUpView.swift
//  TodoList
//
//  Created by Никита Коголенок on 19.08.22.
//

import SwiftUI

struct SignInView: View {
    
    @State private var emailTextField = ""
    @State private var passwordTextField = ""
    
    var body: some View {
        
        
        VStack(spacing: 0) {
            
            VStack(alignment: .leading) {
                Text("Welcom back")
                    .frame(width: 198, height: 41, alignment: .leading)
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 32))
                    .foregroundColor(FontsStyleManager.Roboto.colorThin)
                    
                    
                Text("Sign up to continue")
                    .frame(width: 138, height: 19, alignment: .leading)
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 16))
                    .foregroundColor(FontsStyleManager.Roboto.colorMedium)
            }
            .padding(.top, 0)
            .padding(.leading, 30)
            .padding(.trailing, 153)
            .padding(.bottom, 50)
            
            VStack(alignment: .leading) {
                Text("Username")

                TextField("Enter your email", text: $emailTextField)
                Rectangle()
                    .frame(width: 326, height: 3)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 30)
            .padding(.top, 25)
            .padding(.trailing, 20)
            
            VStack(alignment: .leading) {
                Text("Password")
                TextField("Enter your password", text: $passwordTextField)
                Rectangle()
                    .frame(width: 326, height: 3)
                    .foregroundColor(.gray)
            }
            .padding(.leading, 30)
            .padding(.top, 25)
            .padding(.trailing, 20)
            
            VStack(alignment: .center, spacing: 51) {
                Button("Sign Up") {
                    print("SignUp")
                }
                .frame(width: 327, height: 48)
                .background(FontsStyleManager.Roboto.colorButtonRed)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                .foregroundColor(FontsStyleManager.Roboto.colorThin)
                
                Button("Sign In") {
                    print("SignIn")
                }
                .frame(width: 55, height: 21)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                .foregroundColor(FontsStyleManager.Roboto.colorThin)
            }
            .padding(.leading, 30)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
