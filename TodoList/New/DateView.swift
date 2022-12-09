//
//  DateView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 4.11.22.
//

import SwiftUI

struct DateView: View {
    var body: some View {
        VStack (spacing: 3) {
            
            HStack {
                Image("calendar")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.gray)
                    .padding(.leading, 39)
                Text("Due Date")
                    .font(.custom(FontsStyleManager.Roboto.medium, size: 16))
                    .foregroundColor(Color(red: 0.604, green: 0.604, blue: 0.604))
                    .padding(.leading, 25)
                Spacer()
            }
            
            Text("Aug 5,2018")
                .padding(.trailing, 135)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 16))
        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
