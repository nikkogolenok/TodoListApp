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
                        .keyboardType(.emailAddress)
                    Rectangle()
                        .frame(width: 326, height: 3)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 30)
                .padding(.top, 25)
                .padding(.trailing, 20)
                
                VStack(alignment: .leading) {
                    Text("Password")
                    SecureField("Enter your password", text: $passwordTextField)
                    Rectangle()
                        .frame(width: 326, height: 3)
                        .foregroundColor(.gray)
                }
                .padding(.leading, 30)
                .padding(.top, 25)
                .padding(.trailing, 20)
                

                NavigationLink(destination: ForgotPasswordView(), label: {
                    Text("Forgot password")
                })
                .frame(width: 136, height: 21)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                .foregroundColor(.gray)
                .padding(.top, 12)
                .padding(.leading, 190)
                
                VStack(alignment: .center, spacing: 118) {
                    Button("Sign Up") {
                        print("SignUp")
                    }
                    .frame(width: 327, height: 48)
                    .background(FontsStyleManager.Roboto.colorRed)
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                    .foregroundColor(FontsStyleManager.Roboto.colorThin)
                    
                    Button("Sign In") {
                        print("SignIn")
                    }
                    .frame(width: 60, height: 21)
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                    .foregroundColor(FontsStyleManager.Roboto.colorThin)
                }
                .padding(.top, 72)
                //.padding(.leading, 30)
            }
        
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
