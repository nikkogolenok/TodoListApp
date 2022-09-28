//
//  Fancy3DotsIndexView.swift
//  TodoList
//
//  Created by Никита Коголенок on 28.09.22.
//

import SwiftUI

struct Fancy3DotsIndexView: View {
    
    // MARK: - Variables
    let numberOfPages: Int
    let currentIndex: Int
    private let circleSize:    CGFloat = 8
    private let circleSpacing: CGFloat = 8
    private let primaryColor = Color.black
    private let secondaryColor = Color.black.opacity(0.2)
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .fill(currentIndex == index ? primaryColor : secondaryColor)
                    .scaleEffect(1)
                    .frame(width: circleSize, height: circleSize)
                    .id(index)
            }
        }
        .offset(y: -50)
        .padding(.init(top: 450, leading: 0, bottom: 0, trailing: 0))
    }
}
