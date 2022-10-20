//
//  MenuView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.09.22.
//

import SwiftUI

@MainActor class Show: ObservableObject {
    @Published var show = false
    @Published var textAlert = ""
    @Published var projects: [ProjectModel] = []
}

struct MenuView: View {
    
    // MARK: - Variable
    @StateObject var showAlert = Show()
    
    // MARK: - Boby
    var body: some View {
        ZStack {
            VStack {
                VStack{
                    Text("Project")
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 20))
                }
                .background(Color.white)
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 20), count: 2), spacing: 20 ) {
                        ForEach(showAlert.projects) { project in
                            ProjectCell(project: project)
                        }
                    }
                    .padding(.top)
                    
                    HStack {
                        Button(action: {
                            showAlert.show.toggle()
                        }) {
                            Text("+")
                                .font(.custom(FontsStyleManager.Roboto.thin, size: 24))
                                .foregroundColor(.white)
                        }
                        .frame(width: 80, height: 80)
                        .background(FontStyleColors.colorAddProject)
                        .border(Color(.clear), width: 2)
                        .cornerRadius(5)
                        .padding(.top,24)
                        
                        Spacer()
                    }
                    .padding(.leading, 20)
                    Spacer()
                }
                .background(Color(red: 253/255, green: 253/255, blue: 253/255))
                .navigationBarHidden(true)
            }
            
            if showAlert.show {
                GeometryReader { _ in
                    AddProjectAlert()
                        .environmentObject(showAlert)
                        .cornerRadius(5)
                        .padding(.leading, 24)
                        .padding(.top, 241)

                }
                .background(
                    Color.black.opacity(0.5)
                        .onTapGesture {
                            withAnimation {
                                showAlert.show.toggle()
                            }
                        }
                )
            
            }
        }
        .ignoresSafeArea(edges: .all)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
