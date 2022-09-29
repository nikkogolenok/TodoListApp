//
//  ProfileView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.09.22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        Text("Profile")
            .background(Color.red)
        
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Profile")
            .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
            .foregroundColor(.white)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
