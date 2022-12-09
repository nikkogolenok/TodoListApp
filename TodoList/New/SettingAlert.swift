//
//  SettingAlert.swift
//  ToDoList
//
//  Created by Alex Paramonov on 8.11.22.
//

import SwiftUI

struct SettingAlert: View {
    var body: some View {
        ZStack {
            
            VStack {
                
                Color.white
            }
            
            HStack {
                
                VStack(spacing: 17){
                    
                    Text("Add Member")
                        .padding(.trailing, 110)
                    Text("Edit Task")
                        .padding(.trailing, 139)
                    Text("Delete Task")
                        .padding(.trailing, 120)
                }
                .font(.custom(FontsStyleManager.Roboto.thin, size: 17))
                .padding(.leading)
                Spacer()
            }
            
        }
        .frame(width: 228, height: 130)
        .cornerRadius(5)
    }
}

struct SettingAlert_Previews: PreviewProvider {
    static var previews: some View {
        SettingAlert()
    }
}
