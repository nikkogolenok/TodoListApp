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
    
    // MARK: - Body
    var body: some View {
        
        ZStack {
            VStack {
                Rectangle()
                    .frame(height: 44)
                    .foregroundColor(FontStyleColors.colorRed)
                
                Spacer()
//
//                Rectangle()
//                    .frame(height: 90)
//                    .foregroundColor(FontStyleColors.colorBar)
                
                TabBarView(viewRouter: ViewRouter())
            }
            .edgesIgnoringSafeArea(.bottom)
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("Title")
                    Text("Lorem ipsum dolor sit amet,consectetur adiiscing elet.")
                }
                
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
                
                Button(action: {
                    
                    
                }) {
                    Text("Done")
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                        .foregroundColor(FontStyleColors.colorWhite)
                }
                .frame(width: 295, height: 48)
                .background(FontStyleColors.colorRed)
            }
//            .padding(.leading, 30)
            .background(
                Rectangle()
                    .fill(Color.white)
                    .shadow(color: Color.gray.opacity(0.7),
                            radius: 9,
                            x: 0, y: 0)
            )
            .offset(y: -145)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationTitle("Add Check List")
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(
            FontStyleColors.colorRed,
            for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                CustomBackButton {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

@available(iOS 16.0, *)
struct CreateCheckListView_Previews: PreviewProvider {
    static var previews: some View {
        CreateCheckListView()
    }
}


struct SmallSquare: View {
    
    var body: some View {
        Rectangle()
            .frame(width: 20, height: 20)
            .foregroundColor(.gray)
            .border(.black, width: 1)
            .cornerRadius(3)
    }
}
