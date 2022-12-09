//
//  AssignedView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 2.11.22.
//

import SwiftUI

struct AssignedView: View {
    var body: some View {
        HStack {
            
            Image("1")
                .resizable()
                .frame(width: 44, height: 44)
            
            VStack {
                Text("Assigned to")
                    .font(.custom(FontsStyleManager.Roboto.medium, size: 16))
                    .foregroundColor(Color(red: 0.604, green: 0.604, blue: 0.604))
                    .padding(.bottom, -3)
                Text("Valera Pasik")
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 16))
            }
            .padding(.leading, 12)
            Spacer()
        }
      

    }
}

struct AssignedView_Previews: PreviewProvider {
    static var previews: some View {
        AssignedView()
    }
}
