//
//  ResetPasswordView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.08.22.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @Environment (\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var emailTextField = ""
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 50) {
            VStack(alignment: .leading, spacing: 12) {
                Text("Reset Password")
                    .padding(.init(top: 34, leading: 0, bottom: 0, trailing: 115))
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 30))
                    .foregroundColor(FontStyleColors.colorThin)
                Text("Reset code was sent to your email. Please enter the code and create new password")
                    .padding(.init(top: 12, leading: 0, bottom: 0, trailing: 10))
                    .font(.custom(FontsStyleManager.Roboto.medium, size: 16))
                    .foregroundColor(FontStyleColors.colorMedium)
                    .multilineTextAlignment(.leading)
            }
            
            VStack(alignment: .leading, spacing: 17) {
                Text("Reset code")
                TextField("Enter your number", text: $emailTextField)
                Rectangle()
                    .frame(width: 326, height: 1)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading, spacing: 17) {
                Text("New password")
                TextField("Enter your password", text: $emailTextField)
                Rectangle()
                    .frame(width: 326, height: 1)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading, spacing: 17) {
                Text("Confirm password")
                TextField("Enter your confirm password", text: $emailTextField)
                Rectangle()
                    .frame(width: 326, height: 1)
                    .foregroundColor(.gray)
            }
            
            NavigationLink("Change password") {
                SuccesfulView()
            }
            .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
            .frame(width: 327, height: 48)
            .background(Color(red: 0.976, green: 0.376, blue: 0.376, opacity: 1))
            .foregroundColor(Color(red: 1, green: 1, blue: 1, opacity: 1))
            .cornerRadius(5)
        }
        .padding(.top, 0)
        .padding(.leading, 24)
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

struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
