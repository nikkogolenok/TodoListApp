//
//  SignUpView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.08.22.
//

import SwiftUI

struct SignUpView: View {
    
    // MARK: - Variables
    @State private var emailTextField = ""
    @State private var passwordTextField = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var image = UIImage()
    @State private var showSheet = false
    
    var body: some View {
        VStack(spacing: 0) {
            VStack() {
                Text("Welcome")
                    .padding(.init(top: 94, leading: 0, bottom: 0, trailing: 224))
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 32))
                    .foregroundColor(FontsStyleManager.Roboto.colorThin)
                Text("Sign up to continue")
                    .padding(.init(top: 12, leading: 0, bottom: 0, trailing: 213))
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 16))
                    .foregroundColor(FontsStyleManager.Roboto.colorMedium)
            }
            
            ZStack(alignment: .center) {
                Image(uiImage: self.image)
                    .resizable()
                    .frame(width: 104, height: 104)
                    .cornerRadius(52)
                    .background(Color.black.opacity(0.2))
                    .aspectRatio(contentMode: .fill)
                    .clipShape(Circle())
                    .padding(.init(top: 28, leading: 0, bottom: 0, trailing: 0))
                    
                Text("x")
                .frame(width: 104, height: 104)
                .cornerRadius(52)
                .padding(.top, 28)
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
                .background(FontsStyleManager.Roboto.colorRed)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                .foregroundColor(FontsStyleManager.Roboto.colorThin)
                .cornerRadius(5)
                
                
                NavigationLink("Sign In") {
                    SignInView()
                }
                .frame(width: 60, height: 21)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                .foregroundColor(FontsStyleManager.Roboto.colorThin)
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
