//
//  CustomBackButton.swift
//  TodoList
//
//  Created by Никита Коголенок on 2.09.22.
//

import SwiftUI

struct CustomBackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "arrow.backward")
                .foregroundColor(.black)
        }
    }
}
