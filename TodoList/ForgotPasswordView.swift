//
//  ForgotPasswordView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.08.22.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State private var emailTextField = ""
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 50) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Forgot Password")
                    .frame(width: 248, height: 41)
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 30))
                    .foregroundColor(FontsStyleManager.Roboto.colorThin)
                Text("Please enter your email below to recevie your password reset instructions")
                    .frame(width: 340, height: 38)
                    .font(.custom(FontsStyleManager.Roboto.medium, size: 16))
                    .foregroundColor(FontsStyleManager.Roboto.colorMedium)
                    .multilineTextAlignment(.leading)
            }
            
            VStack(alignment: .leading, spacing: 17) {
                Text("Username")
                TextField("Enter your email", text: $emailTextField)
                    .keyboardType(.emailAddress)
                Rectangle()
                    .frame(width: 326, height: 3)
                    .foregroundColor(.gray)
            }
            
            NavigationLink("Send Request") {
                ResetPasswordView()
            }
            .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
            .frame(width: 327, height: 48)
            .background(Color(red: 0.976, green: 0.376, blue: 0.376, opacity: 1))
            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
            .cornerRadius(5)
        }
        .padding(.top, 0)
        .padding(.leading, 24)
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

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
