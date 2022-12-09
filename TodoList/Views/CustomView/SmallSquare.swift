//
//  SmallSquare.swift
//  TodoList
//
//  Created by Никита Коголенок on 23.11.22.
//

import SwiftUI

struct SmallSquare: View {
    
    var body: some View {
        Rectangle()
            .frame(width: 20, height: 20)
            .foregroundColor(Color(red: 0.956, green: 0.956, blue: 0.956))
            .border(.black, width: 1)
            .cornerRadius(3)
    }
}
