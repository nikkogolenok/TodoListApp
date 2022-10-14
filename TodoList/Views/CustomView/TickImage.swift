//
//  TickImage.swift
//  TodoList
//
//  Created by Никита Коголенок on 4.10.22.
//

import SwiftUI

struct TickImage: View {
    
    // MARK: - Variable
    let nameImage = "chevron.down"
    
    // MARK: - Body
    var body: some View {
        
        Image(systemName: nameImage)
            .resizable()
            .foregroundColor(FontStyleColors.colorWhite)
            .frame(width: 18, height: 12)
    }
}
