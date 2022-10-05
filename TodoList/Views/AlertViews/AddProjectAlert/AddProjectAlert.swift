//
//  AddProjectAlert.swift
//  TodoList
//
//  Created by Никита Коголенок on 2.10.22.
//

import SwiftUI

enum TapToColors {
    case blue
    case red
    case green
    case black
    case white
}

struct AddProjectAlert: View {
    
    // MARK: - Variables
    @State private var textFieldProject = ""
    @State private var changeColor: TapToColors = .blue
    @EnvironmentObject var alert: Show
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            VStack(alignment: .leading, spacing: 24) {
                Text("Title")
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                    .foregroundColor(FontStyleColors.colorGray)
                
                TextField("Enter name project", text: $textFieldProject) {
                    
                }
                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                .foregroundColor(Color.black.opacity(1))
                .onChange(of: textFieldProject) { value in
                    if value.count > 32 {
                        self.textFieldProject = String(value.prefix(32))
                    }
                }
            }
            
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
            
            Button(action: {
                alert.textAlert = String(textFieldProject)
                alert.show.toggle()
            }) {
                Text("Done")
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                    .foregroundColor(FontStyleColors.colorWhite)
            }
            .frame(width: 295, height: 48)
            .background(FontStyleColors.colorRed)
            
        }
        .padding(.leading, 29)
        .frame(width: 327, height: 350)
        .background(FontStyleColors.colorWhite)
    }
}

struct AddProjectAlert_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectAlert()
    }
}
