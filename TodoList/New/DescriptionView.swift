//
//  DescriptionView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 4.11.22.
//

import SwiftUI

struct DescriptionView: View {
    var body: some View {
        VStack(spacing: 3) {
            
            HStack {
                
                Image("description")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                    .padding(.leading, 39)
                
                
                Text("Decription")
                    .font(.custom(FontsStyleManager.Roboto.medium, size: 16))
                    .foregroundColor(Color(red: 0.604, green: 0.604, blue: 0.604))
                    .padding(.leading, 25)
                
                Spacer()
                
            }
            .padding(.top, 16)
            
            Text("Lorem ipsum dolor sit amet,consectetur adipiscing. ")
                .font(.custom(FontsStyleManager.Roboto.medium, size: 16))
                .frame(width: 250, height: 48)
                .padding(.leading, 1)
                .padding(.top, 1)
        }
    }
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView()
    }
}
