//
//  CreateCheckListView.swift
//  TodoList
//
//  Created by Никита Коголенок on 6.10.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct CreateCheckListView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var changeColor: TapToColors = .blue
    @StateObject var viewRouter: ViewRouter
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            VStack {
//                Rectangle()
//                    .frame(height: 44)
//                    .foregroundColor(FontStyleColors.colorRed)
                
                CustomNavigationView(title: "Add Check")
                
                Spacer()
                
                TabBarView(viewRouter: ViewRouter())
            }
            .edgesIgnoringSafeArea(.bottom)
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Title")
                    Text("Lorem ipsum dolor sit amet,consectetur adiiscing elet.")
                }
                .padding(.bottom, 18)
                
                VStack {
                    HStack {
                        SmallSquare()
                        
                        Text("List Item 1")
                    }
                    
                    HStack {
                        SmallSquare()
                        
                        Text("List Item 2")
                    }
                    
                    HStack {
                        SmallSquare()
                        
                        Text("List Item 3")
                    }
                    
                    HStack {
                        SmallSquare()
                        
                        Text("List Item 4")
                    }
                }
                
                
                Text("+ Add new item")
                    .padding(.bottom, 41)
                
                VStack(alignment: .leading, spacing: 17) {
                    Text("Choose Color")
                    
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
                .padding(.bottom, 40)
                
                NavigationLink {
                    WorkListView(viewRouter: viewRouter)
                } label: {
                    Text("Done")
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                        .foregroundColor(FontStyleColors.colorWhite)
                }
                .frame(width: 295, height: 48)
                .background(FontStyleColors.colorRed)
                
            }
            .frame(width: 343, height: 576)
            .background(
                Rectangle()
                    .fill(Color.white)
                    .shadow(color: Color.gray.opacity(0.7),
                            radius: 9,
                            x: 0, y: 0)
            )
            
            .offset(y: -15)
        }
        .navigationBarBackButtonHidden(true)
    }
}

@available(iOS 16.0, *)
struct CreateCheckListView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCheckListView(viewRouter: ViewRouter())
    }
}

