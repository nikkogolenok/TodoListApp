//
//  ProjectCell.swift
//  TodoList
//
//  Created by Никита Коголенок on 4.10.22.
//

import SwiftUI

enum ChooseImage: String {
    case blue
    case red
    case green
    case violet
    
    var image: Image {
        switch self {
        case .blue:   return Image("circleBlue")
        case .red:    return Image("circlered")
        case .green:  return Image("circleBlue")
        case .violet: return Image("circleViolet")
        }
    }
}

struct ProjectCell: View {
    
    // MARK: - Variables
    //@State private var image: ChooseImage = .blue
    //var nameTask: String
    //var countTack : String
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Image("circleBlue")
                .resizable()
                .frame(width: 26, height: 26)
                .padding(.bottom, 51)
                .padding(.trailing, 100)
            Text("Personal")
            Text("10 Tasks")
            
        }
        .frame(width: 165, height: 180)
        .background(.red)
        .cornerRadius(10)
    }
}

struct ProjectCell_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCell()
    }
}
