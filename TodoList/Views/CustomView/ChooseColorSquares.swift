//
//  ChooseColorSquares.swift
//  TodoList
//
//  Created by Никита Коголенок on 4.10.22.
//

import SwiftUI

struct ChooseColorSquares: View {
    
    // MARK: - Variable
    var color: Color
    
    // MARK: - Body
    var body: some View {
        
        Rectangle()
            .frame(width: 48, height: 48)
            .cornerRadius(5)
            .foregroundColor(color)
    }
}
