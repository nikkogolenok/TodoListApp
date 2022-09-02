//
//  SignUpView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.08.22.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var emailTextField = ""
    @State private var passwordTextField = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                    Text("Welcom")
                        .frame(width: 127, height: 41, alignment: .leading)
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
                
                Circle()
                    .strokeBorder(FontsStyleManager.Roboto.colorRed, lineWidth: 2)
                    .background(Circle().fill(FontsStyleManager.Roboto.colorGray))
                    .frame(width: 108, height: 108)
                    .padding(.leading, 127)
                
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
                
                VStack(alignment: .center, spacing: 51) {
//                    Button("Sign Up") {
//                        print("SignUp")
//                    }
                    NavigationLink(destination: SignInView(), label: {
                        Text("Sign Up")
                    })
                    .frame(width: 327, height: 48)
                    .background(FontsStyleManager.Roboto.colorRed)
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                    .foregroundColor(FontsStyleManager.Roboto.colorThin)
                    .cornerRadius(5)
                    
//                    Button("Sign In") {
//                        print("SignIn")
//                    }
                    NavigationLink(destination: SignInView(), label: {
                        Text("Sign In")
                    })
                    .frame(width: 60, height: 21)
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                    .foregroundColor(FontsStyleManager.Roboto.colorThin)
                }
                .padding(.top, 72)
                .padding(.leading, 30)
            }
            .offset(y: -60)
        }
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image("buttonBack")
        })
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
