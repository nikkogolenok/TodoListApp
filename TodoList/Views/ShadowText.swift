//
//  ShadowText.swift
//  TodoList
//
//  Created by Никита Коголенок on 11.10.22.
//

import SwiftUI

struct ShadowText: View {
    var body: some View {
        
        VStack(spacing: 20) {
            Text("Hello world 1")
                .background(
                    Rectangle()
                        .fill(Color.white)
                        .shadow(color: Color.gray.opacity(0.7),
                                radius: 8,
                                x: 0, y: 0)
            )
            
            Text("Hello world 2")
                .padding()
                .background(
                    Rectangle()
                        .fill(Color.white)
                        .cornerRadius(12)
                        .shadow(color: Color.gray.opacity(0.7),
                                radius: 8)
                )
        }
    }
}

struct ShadowText_Previews: PreviewProvider {
    static var previews: some View {
        ShadowText()
    }
}
