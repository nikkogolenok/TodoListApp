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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
            
            VStack(spacing: 0) {
                
                VStack(alignment: .leading) {
                    Text("Welcome")
                        .padding(.init(top: 94, leading: 0, bottom: 0, trailing: 224))
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 32))
                        .foregroundColor(FontStyleColors.colorThin)
                    
                    
                    Text("Sign up to continue")
                        .padding(.init(top: 12, leading: 0, bottom: 0, trailing: 213))
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 16))
                        .foregroundColor(FontStyleColors.colorMedium)
                }
                
                VStack(alignment: .leading) {
                    Text("Username")
                    
                    TextField("Enter your email", text: $emailTextField)
                        .keyboardType(.emailAddress)
                    Rectangle()
                        .frame(width: 326, height: 3)
                        .foregroundColor(.gray)
                }
                .padding(.init(top: 26, leading: 24, bottom: 17, trailing: 0))
                
                VStack(alignment: .leading) {
                    Text("Password")
                    SecureField("Enter your password", text: $passwordTextField)
                    Rectangle()
                        .frame(width: 326, height: 3)
                        .foregroundColor(.gray)
                }
                .padding(.init(top: 26, leading: 24, bottom: 17, trailing: 0))
                
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
                    .background(FontStyleColors.colorRed)
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                    .foregroundColor(FontStyleColors.colorThin)
                    
                    Button("Sign In") {
                        print("SignIn")
                    }
                    .frame(width: 60, height: 21)
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                    .foregroundColor(FontStyleColors.colorThin)
                }
                .padding(.top, 72)
            }
            .offset(y: -50)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    CustomBackButton {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
