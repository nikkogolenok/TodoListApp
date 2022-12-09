//
//  CreateNoteView.swift
//  TodoList
//
//  Created by Никита Коголенок on 6.10.22.
//

import SwiftUI


@available(iOS 16.0, *)
struct CreateNoteView: View {
    
    // MARK: - Variables
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var changeColor: TapToColors = .blue
    @State private var task = ""
    @StateObject var viewRouter: ViewRouter
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            VStack {
                CustomNavigationView(title: "Add Note")
                Spacer()
                TabBarView(viewRouter: ViewRouter())
            }
            .edgesIgnoringSafeArea(.bottom)
            
            VStack(alignment: .leading, spacing: 34) {
                VStack(alignment: .leading, spacing: 12) {
                    Text("Description")
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                        .foregroundColor(FontStyleColors.colorGray)
                    
                   
                    TextField("Enter your task description", text: $task)
                        .frame(width: 308, height: 151)
                        .border(FontStyleColors.colorSilver, width: 1)
                 
                    
                    VStack(alignment: .leading, spacing: 17) {
                        Text("Choose Color")
                            .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                            .foregroundColor(FontStyleColors.colorGray)
                        
                        HStack(spacing: 12) {
                            ZStack {
                                ChooseColorSquares(color: FontStyleColors.colorSquareBlue)
                                    .onTapGesture {
                                        self.changeColor = .blue
                                    }
                                if changeColor == .blue {
                                    TickImage()
                                }
                            }
                            
                            ZStack {
                                ChooseColorSquares(color: FontStyleColors.colorSquareRed)
                                    .onTapGesture {
                                        self.changeColor = .red
                                    }
                                if changeColor == .red {
                                    TickImage()
                                }
                            }
                            
                            ZStack {
                                ChooseColorSquares(color: FontStyleColors.colorSquareGreen)
                                    .onTapGesture {
                                        self.changeColor = .green
                                    }
                                if changeColor == .green {
                                    TickImage()
                                }
                            }
                            
                            ZStack {
                                ChooseColorSquares(color: FontStyleColors.colorSquareBlack)
                                    .onTapGesture {
                                        self.changeColor = .black
                                    }
                                if changeColor == .black {
                                    TickImage()
                                }
                            }
                            
                            ZStack {
                                ChooseColorSquares(color: FontStyleColors.colorSquareLightBrown)
                                    .onTapGesture {
                                        self.changeColor = .white
                                    }
                                if changeColor == .white {
                                    TickImage()
                                }
                            }
                        }
                        
                    }
                    
                    
                    NavigationLink {
                        WorkListView(viewRouter: viewRouter)
                        
                    } label: {
                        Text("Done")
                            .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                            .foregroundColor(FontStyleColors.colorWhite)
                    }
                    .frame(width: 295, height: 48)
                    .background(FontStyleColors.colorRed)
                    .cornerRadius(5)
                    
                }
                .frame(width: 343, height: 468)
                .background(
                    Rectangle()
                        .fill(Color.white)
                        .shadow(color: Color.gray.opacity(0.7),
                                radius: 9,
                                x: 0, y: 0)
                )
                //            .cornerRadius(5)
                .offset(y: -55)
                
                
            }
            .navigationBarBackButtonHidden(true)
        }
    }
    
    @available(iOS 16.0, *)
    struct CreateNoteView_Previews: PreviewProvider {
        static var previews: some View {
            CreateNoteView(viewRouter: ViewRouter())
        }
    }
}

