//
//  QuickView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.09.22.
//

import SwiftUI

struct QuickView: View {
    
    @StateObject var viewModel = TaskViewModel()
    
    var body: some View {
        Text("Quick")
        
            .offset(y: 20)
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
