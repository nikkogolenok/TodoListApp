//
//  TagView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 7.11.22.
//

import SwiftUI

struct TagView: View {
    var body: some View {
        VStack(spacing: 9) {
            
            HStack(spacing: 19) {
                
                Image("tag")
                    .resizable()
                    .frame(width: 21, height: 22)
                
                
                Text("Tag")
                    .font(.custom(FontsStyleManager.Roboto.medium, size: 16))
                    .foregroundColor(Color(red: 0.604, green: 0.604, blue: 0.604))
                Spacer()
            }
            
            HStack {
                
                Button {
                    
                } label: {
                    Text("Person")
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 16))
                }
                .frame(width: 90, height: 40)
                .border(Color(red: 0.91, green: 0.91, blue: 0.91))
                .cornerRadius(5)
                .padding(.leading, 40)
                
                Spacer()
            }
            
        }
        .padding(.top, 11)
        .padding(.leading, 40)
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
    }
}
