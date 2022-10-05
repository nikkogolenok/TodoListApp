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
}

struct MenuView: View {
    @StateObject var showAlert = Show()
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Text("Project")
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 20))
                }
                
                if !showAlert.textAlert.isEmpty {
                    Text("\(showAlert.textAlert)")
                        .font(.custom(FontsStyleManager.Roboto.medium, size: 39))
                }
                
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
                    
                    Spacer()
                }
                .padding(.leading, 20)
                Spacer()
            }
            .background(FontStyleColors.colorWhite)
            .navigationBarHidden(true)
            
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
        .offset(y: 20)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Projects")
        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
    }
}
    

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
