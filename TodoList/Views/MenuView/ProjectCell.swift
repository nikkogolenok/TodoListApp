//
//  ProjectCell.swift
//  TodoList
//
//  Created by Никита Коголенок on 4.10.22.
//

import SwiftUI


struct ProjectCell: View {
    
    // MARK: - Variable
    var project: ProjectModel

    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                ZStack {
                    Circle()
                        .frame(width: 26, height: 26)
                        .foregroundColor(Color(project.color.rawValue).opacity(0.2))
                    
                    Circle()
                        .frame(width: 14, height: 14)
                        .foregroundColor(Color(project.color.rawValue))
                }
                .padding(.top, 30)
                .padding(.leading, 24)
                .padding(.bottom, 52)
                Spacer()
            }
            
            VStack(spacing: 17) {
                HStack {
                    Text(project.nameProject)
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                    Spacer()
                }
                
                HStack {
                    Text("\(project.tasks.count) Tasks")
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                        .foregroundColor(FontStyleColors.colorGray)
                        .padding(.bottom, 27)
                    Spacer()
                }
            }
            .padding(.leading, 24)
        }
        .frame(width: 165, height: 180)
        .border(.red, width: 2)
        .background(
            Rectangle()
                .fill(Color.white)
                .shadow(color: Color.gray.opacity(0.7),
                        radius: 9,
                        x: 0, y: 0)
        )
        .cornerRadius(10)
    }
}

struct ProjectCell_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCell(project: ProjectModel(color: .white, nameProject: "Personal"))
    }
}
