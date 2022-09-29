//
//  AlertPlusButton.swift
//  TodoList
//
//  Created by Никита Коголенок on 29.09.22.
//

import SwiftUI

struct AlertPlusButton: View {
    
    
    // MARK: - Body
    var body: some View {
            VStack(spacing: 24) {
                NavigationLink("Add Task") {
                    //CreateTaskView()
                }
                .frame(width: 268)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                .foregroundColor(.black)
                Rectangle()
                    .frame(width: 267, height: 2)
                    .foregroundColor(Color(red: 228/255, green: 228/255, blue: 228/255))
                NavigationLink("Add Quick Note") {
                    //CreateNoteView()
                }
                    .frame(width: 268)
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                    .foregroundColor(.black)
                Rectangle()
                .frame(width: 267, height: 2)
                .foregroundColor(Color(red: 228/255, green: 228/255, blue: 228/255))
                NavigationLink("Add Check List") {
                    //CreateCheckListView()
                }
                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                .foregroundColor(.black)
                .frame(width: 268)

            }
        .frame(width: 268, height: 214)
        .cornerRadius(2)
        .background(Color.white)
    }
}

struct AlertPlusButton_Previews: PreviewProvider {
    static var previews: some View {
        AlertPlusButton()
    }
}