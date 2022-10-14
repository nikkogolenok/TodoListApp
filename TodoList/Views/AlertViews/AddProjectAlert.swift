//
//  AddProjectAlert.swift
//  TodoList
//
//  Created by Никита Коголенок on 2.10.22.
//

import SwiftUI

enum TapToColors {
    case blue
    case red
    case green
    case black
    case white
}

struct AddProjectAlert: View {
    
    // MARK: - Variables
    @State private var textFieldProject = ""
    @State private var changeColor: TapToColors = .blue
    @EnvironmentObject var alert: Show
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Text("Title")
                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
            
            TextField("Enter name project", text: $textFieldProject) {
                
            }
        }
        .padding(.leading, 29)
        
        VStack {
            Text("Choose Color")
                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
            
        }
    }
}

struct AddProjectAlert_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectAlert()
    }
}
