//
//  QuickView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.09.22.
//

import SwiftUI

struct QuickView: View {
    var body: some View {
        Text("Quick")
            .background(Color.red)
        
            .navigationBarBackButtonHidden(true)
            .navigationTitle("Quick Notes")
            .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
            .foregroundColor(.white)
    }
}

struct QuickView_Previews: PreviewProvider {
    static var previews: some View {
        QuickView()
    }
}
