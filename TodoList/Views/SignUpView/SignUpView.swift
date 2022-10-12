//
//  SignUpView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.08.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct SignUpView: View {
    
    // MARK: - Variables
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewRouter = ViewRouter()
    @State private var emailTextField = ""
    @State private var passwordTextField = ""
    @State private var image = UIImage()
    @State private var showSheet = false
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            WelcomLabels(title: "Welcome", subTitle: "Sign up to continue",
                         top: 60, leading: 24, bottom: 0, trailing: 213)
            
            ZStack(alignment: .center) {
                Image(uiImage: self.image)
                    .resizable()
                    .frame(width: 104, height: 104)
                    .cornerRadius(52)
                    .background(FontStyleColors.colorGray)
                    .border(FontStyleColors.colorRed, width: 1)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .padding(.init(top: 28, leading: 0, bottom: 0, trailing: 0))
                    .onTapGesture {
                        showSheet = true
                    }
            }
            .sheet(isPresented: $showSheet) {
                ImagePicker(sourseType: .photoLibrary, selectedImage: self.$image)
            }
        
            RegistrationTextFields(emailTextField: emailTextField,
                                   passwordTextField: passwordTextField,
                                   titleUser: "Username",
                                   textFieldUser: "Enter your email",
                                   titlePassword: "Password",
                                   textFieldPassword: "Enter your password",
                                   top: 26, leading: 24, bottom: 17, trailing: 0)
            
            TwoNavigationLink(viewRouter: viewRouter,
                              titleLinkOne: "Sign Up",
                              titleLinkTwo: "Sign In",
                              spacing: 51,
                              top: 72, leading: 0, bottom: 0, trailing: 0)
        }
        .offset(y: -40)
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
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
