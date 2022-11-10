//
//  RectangularAndText.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.10.22.
//

import SwiftUI

struct RectangularAndText: View {
    
    // MARK: - Variables
    let text: String
    let textInRectangular: String
    
    // MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Text(text)
            
            ZStack {
                Rectangle()
                    .frame(width: 90, height: 48)
                    .cornerRadius(50)
                    .foregroundColor(FontStyleColors.colorGray)
                Text(textInRectangular)
            }
        }
    }
}

struct RectangularAndText_Previews: PreviewProvider {
    static var previews: some View {
        RectangularAndText(text: "For", textInRectangular: "Assignee")
    }
}
