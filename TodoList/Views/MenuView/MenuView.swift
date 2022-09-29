//
//  MenuView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.09.22.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        Text("Menu")
            .foregroundColor(.red)
        
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Project")
            .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
    }
}
    

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
