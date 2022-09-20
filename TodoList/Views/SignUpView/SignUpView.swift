//
//  SignUpView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.08.22.
//

import SwiftUI

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
            VStack() {
                Text("Welcome")
                    .padding(.init(top: 94, leading: 0, bottom: 0, trailing: 224))
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 32))
                    .foregroundColor(FontStyleColors.colorThin)
                Text("Sign up to continue")
                    .padding(.init(top: 12, leading: 0, bottom: 0, trailing: 213))
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 16))
                    .foregroundColor(FontStyleColors.colorMedium)
            }
            
            ZStack(alignment: .center) {
                Image(uiImage: self.image)
                    .resizable()
                    .frame(width: 104, height: 104)
                    .cornerRadius(52)
                    //.border(FontStyleColors.colorRed, width: 2)
                    .background(FontStyleColors.colorGray)
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .padding(.init(top: 28, leading: 0, bottom: 0, trailing: 0))
                    .onTapGesture {
                        showSheet = true
                    }
            }
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Username")
                    .font(.custom(FontsStyleManager.Roboto.medium, size: 20))
                
                TextField("Enter your email", text: $emailTextField)
                    .keyboardType(.emailAddress)
                
                Rectangle()
                    .frame(width: 326, height: 3)
                    .foregroundColor(.gray)
            }
            .padding(.init(top: 26, leading: 24, bottom: 17, trailing: 0))
            
            
            VStack(alignment: .leading) {
                Text("Password")
                    .font(.custom(FontsStyleManager.Roboto.medium, size: 20))
                SecureField("Enter your password", text: $passwordTextField)
                
                Rectangle()
                    .frame(width: 326, height: 3)
                    .foregroundColor(.gray)
            }
            .padding(.init(top: 26, leading: 24, bottom: 17, trailing: 0))
            
            VStack(alignment: .center, spacing: 51) {
                NavigationLink("Sign Up") {
                    SignInView()
                }
                .frame(width: 327, height: 48)
                .background(FontStyleColors.colorRed)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                .foregroundColor(FontStyleColors.colorThin)
                .cornerRadius(5)
                
                
                NavigationLink("Sign In") {
                    WorkListView(viewRouter: viewRouter)
                }
                .frame(width: 60, height: 21)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                .foregroundColor(FontStyleColors.colorThin)
            }
            .padding(.init(top: 72, leading: 0, bottom: 0, trailing: 0))
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
        
        .sheet(isPresented: $showSheet) {
            ImagePicker(sourseType: .photoLibrary, selectedImage: self.$image)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
