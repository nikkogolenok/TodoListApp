//
//  MembersView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 4.11.22.
//

import SwiftUI

struct MembersView: View {
    var body: some View {
        VStack {
            
            HStack {
                
                Image("members")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                    .padding(.leading, 39)
                
                
                Text("Members")
                    .font(.custom(FontsStyleManager.Roboto.medium, size: 16))
                    .foregroundColor(Color(red: 0.604, green: 0.604, blue: 0.604))
                    .padding(.leading, 25)
                Spacer()
            }
            
            HStack(spacing: 5) {
                
                Image("1")
                    .resizable()
                    .frame(width: 44, height: 44)
                Image("3")
                    .resizable()
                    .frame(width: 44, height: 44)
                
                Image("other")
                    .resizable()
                    .frame(width: 32, height: 32)
                
                Spacer()
            }
            .padding(.top, 11)
            .padding(.leading, 90)
        }
    }
}

struct MembersView_Previews: PreviewProvider {
    static var previews: some View {
        MembersView()
    }
}
