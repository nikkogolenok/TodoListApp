//
//  SignUpView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.08.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct SignUpView: View {
    
    //MARK: - Localized Property
    private let buttonText = NSLocalizedString("subtitleScreenOne", comment: "")
    private let titleSingUpScreen = NSLocalizedString("titleSingUpScreen", comment: "")
    private let subtitleSingUpScreen = NSLocalizedString("subtitleSingUpScreen", comment: "")
    private let usernameLocalized = NSLocalizedString("Username", comment: "")
    private let placeholderEmail = NSLocalizedString("placeholderEmail", comment: "")
    private let Password = NSLocalizedString("Password", comment: "")
    private let placeholderPassword = NSLocalizedString("placeholderPassword", comment: "")
    private let singUpButton = NSLocalizedString("Sing_Up", comment: "")
    private let singInButton = NSLocalizedString("Sing_In", comment: "")
    
    // MARK: - Variables
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var viewRouter = ViewRouter()
    @State private var username = ""
    @State private var password = ""
    @State private var useremail = ""
    @Binding var isLoading: Bool
    @State private var image = UIImage()
    @State private var showSheet = false
    @ObservedObject var userViewModel = UserViewModel()
    
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
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Username")
                    .font(.custom(FontsStyleManager.Roboto.medium, size: 20))
                
                TextField("Enter your name", text: $username)
                    .textContentType(.username)
                
                Rectangle()
                    .frame(width: 326, height: 1)
                    .foregroundColor(.gray)
            }
            .padding(.init(top: 26, leading: 24, bottom: 17, trailing: 0))
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Email")
                    .font(.custom(FontsStyleManager.Roboto.medium, size: 20))
                
                TextField("Enter your email", text: $useremail)
                    .textContentType(.username)
                
                Rectangle()
                    .frame(width: 326, height: 1)
                    .foregroundColor(.gray)
            }
            .padding(.init(top: 10, leading: 24, bottom: 17, trailing: 0))
            
            VStack(alignment: .leading) {
                Text("Password")
                    .font(.custom(FontsStyleManager.Roboto.medium, size: 20))
                SecureField("Enter your password", text: $password) {
                    
                }
                .textContentType(.password)
                
                Rectangle()
                    .frame(width: 326, height: 1)
                    .foregroundColor(.gray)
            }
            .padding(.init(top: 26, leading: 24, bottom: 17, trailing: 0))
            
            VStack(alignment: .center, spacing: 51) {
                Button("Sign Up") {
                    userViewModel.signUp(username: username, email: useremail, password: password)
                }
                .font(.custom(FontsStyleManager.Roboto.thin, size: 21))
                .frame(width: 327, height: 48)
                .background(FontStyleColors.colorRed)
                .cornerRadius(5)
                .foregroundColor(FontStyleColors.colorWhite)
                .cornerRadius(5)
                
                NavigationLink("Sign In") {
                    SignInView()
                    //WorkListView(viewRouter: viewRouter)
                }
                .frame(width: 60, height: 21)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                .cornerRadius(5)
                .foregroundColor(FontStyleColors.colorRed)
            }
            .padding(.top, 52)
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
