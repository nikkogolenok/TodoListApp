//
//  SignUpView.swift
//  TodoList
//
//  Created by Никита Коголенок on 19.08.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct SignInView: View {
    
    @State private var emailTextField = ""
    @State private var passwordTextField = ""
    @State private var username = ""
    @State private var password = ""
    @State var isLogin: Bool = false
    @ObservedObject var userViewModel = UserViewModel()
    @StateObject var viewRouter = ViewRouter()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
            VStack(spacing: 0) {

                WelcomLabels(title: "Welcome back", subTitle: "Sign up to continue",
                             top: 60, leading: 24, bottom: 0, trailing: 141)
                
//                RegistrationTextFields(titleUser: "Username",
//                                       textFieldUser: "Enter your email",
//                                       titlePassword: "Password",
//                                       textFieldPassword: "Enter your password",
//                                       top: 26, leading: 24, bottom: 17, trailing: 0)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Username")
                        .font(.custom(FontsStyleManager.Roboto.medium, size: 20))
                    
                    TextField("Enter your email", text: $username) {
                        
                    }
                    .textContentType(.username)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .font(.system(size: 16))
                    
                    Rectangle()
                        .frame(width: 326, height: 1)
                        .foregroundColor(.gray)
                }
                .padding(.init(top: 26, leading: 24, bottom: 17, trailing: 0))
                
                
                VStack(alignment: .leading) {
                    Text("Password")
                        .font(.custom(FontsStyleManager.Roboto.medium, size: 20))
                    SecureField("Enter your password", text: $password) {
                        
                    }
                    .textContentType(.password)
                    .font(.system(size: 16))
                    
                    Rectangle()
                        .frame(width: 326, height: 1)
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
                    NavigationLink("Sign Up") {
                        SignUpView(isLoading: $isLogin, userViewModel: userViewModel)
                    }
                    .frame(width: 327, height: 48)
                    .background(FontStyleColors.colorRed)
                    .cornerRadius(5)
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                    .foregroundColor(FontStyleColors.colorThin)

                    NavigationLink("Sign In") {
                        WorkListView(viewRouter: viewRouter)
                    }
                    .frame(width: 60, height: 21)
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                    .foregroundColor(FontStyleColors.colorThin)
                }
                .padding(.top, 72)
                
//                TwoNavigationLink(titleLinkOne: "Sign Up",
//                                  titleLinkTwo: "Sign In",
//                                  spacing: 118,
//                                  top: 72, leading: 0, bottom: 0, trailing: 0)
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

@available(iOS 16.0, *)
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
