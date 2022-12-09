//
//  ProjectViews.swift
//  TodoList
//
//  Created by Никита Коголенок on 7.12.22.
//

import SwiftUI

struct ProjectViews: View {
    @State var projects: [ProjectModel]
    @EnvironmentObject var selectedPerson: PersonAndProject
    
    var body: some View {
        VStack{
            if projects.isEmpty {
                NavigationLink {
                    MenuView()
                } label: {
                    Text("Add Project")
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 20))
                        .foregroundColor(.blue)
                }
            } else {
                ForEach(projects) { project in
                    HStack(spacing: 0) {
                        Text("\(project.nameProject)")
                            .padding(.leading, 16)
                            .padding(.top, 20)
                        Spacer()
                    }
                    .onTapGesture {
                        self.selectedPerson.selectedProject = project.nameProject
                        self.selectedPerson.showProject.toggle()
                    }
                }
            }
           
        }
    }
}

