//
//  AddProjectAlert.swift
//  TodoList
//
//  Created by Никита Коголенок on 14.10.22.
//

import SwiftUI

enum TapToColors: String, Codable {
    case blue = "colorSquareBlue"
    case red = "colorSquareRed"
    case green = "colorSquareGreen"
    case black = "colorSquareBlack"
    case white = "colorSquareLightBrown"
}

struct AddProjectAlert: View {
    
    // MARK: - Variables
    @AppStorage("projects") var protectsStore: Data = Data()
    let encoder = JSONEncoder()
    
    @State private var nameProject = ""
    @State private var changeColor: TapToColors = .blue
    @State private var saveProject: [ProjectModel] = []
    @EnvironmentObject var alert: Show
    
    @State var showProjectCell: Bool = false
    
    // MARK: - Body
    var body: some View {
        VStack() {
            Text("Title")
                .font(.custom(FontsStyleManager.Roboto.thin ,size: 18))
                .padding(.leading, 20)
                .padding(.trailing, 270)
                .padding(.top, 24)
            TextField("Enter name project", text: $nameProject) {
                
            }
            .padding(.top,  24)
            .padding(.leading, 22)
            .font(.custom(FontsStyleManager.Roboto.thin ,size: 18))
            .foregroundColor(Color.black.opacity(1))
            .onChange(of: nameProject) { value in
                if value.count > 32 {
                    self.nameProject =  String(value.prefix(32))
                }
            }
            Text("Choose Color")
                .font(.custom(FontsStyleManager.Roboto.thin ,size: 18))
                .padding(.trailing, 175)
                .padding(.top, 44)
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
            Button(action: {
                print("\(nameProject)")
                let project = ProjectModel(color: changeColor, nameProject: nameProject)
                alert.projects.append(project)
                saveProject.append(project)
                if let data = try? encoder.encode(saveProject) {
                    protectsStore = data
                }
                alert.show.toggle()
            }) {
                Text("Done")
                    .font(.custom(FontsStyleManager.Roboto.thin ,size: 18))
                    .foregroundColor(Color.white)
            }
            .frame(width: 295, height: 48)
            .background(Color(red: 0.976, green: 0.376, blue: 0.376))
            .padding(.top, 25)
            .padding(.trailing, 24)
            .padding(.leading, 24)
            .cornerRadius(5)
            
            
            Spacer()
        }
        .frame(width: 327, height: 350)
        .background(Color.white)
    }
    //    var body: some View {
    //        VStack(spacing: 15) {
    //            VStack(alignment: .leading, spacing: 24) {
    //                Text("Title")
    //                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
    //                    .foregroundColor(FontStyleColors.colorGray)
    //
    //                TextField("Enter name project", text: $nameProject) {
    //
    //                }
    //                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
    //                .foregroundColor(Color.black.opacity(1))
    //                .onChange(of: nameProject) { value in
    //                    if value.count > 32 {
    //                        self.nameProject = String(value.prefix(32))
    //                    }
    //                }
    //            }
    //            .padding(.trailing, 10)
    //
    //            VStack(alignment: .leading, spacing: 17) {
    //                Text("Choose Color")
    //                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
    //                    .foregroundColor(FontStyleColors.colorGray)
    //
    //                HStack(spacing: 12) {
    //                    ZStack {
    //                        ChooseColorSquares(color: FontStyleColors.colorSquareBlue)
    //                            .onTapGesture {
    //                                self.changeColor = .blue
    //                            }
    //                        if changeColor == .blue {
    //                            TickImage()
    //                        }
    //                    }
    //
    //                    ZStack {
    //                        ChooseColorSquares(color: FontStyleColors.)
    //                            .onTapGesture {
    //                                self.changeColor = .red
    //                            }
    //                        if changeColor == .red {
    //                            TickImage()
    //                        }
    //                    }
    //
    //                    ZStack {
    //                        ChooseColorSquares(color: FontStyleColors.)
    //                            .onTapGesture {
    //                                self.changeColor = .green
    //                            }
    //                        if changeColor == .green {
    //                            TickImage()
    //                        }
    //                    }
    //
    //                    ZStack {
    //                        ChooseColorSquares(color: FontStyleColors.colorSquareBlack)
    //                            .onTapGesture {
    //                                self.changeColor = .black
    //                            }
    //                        if changeColor == .black {
    //                            TickImage()
    //                        }
    //                    }
    //
    //                    ZStack {
    //                        ChooseColorSquares(color: FontStyleColors.colorSquareLightBrown)
    //                            .onTapGesture {
    //                                self.changeColor = .white
    //                            }
    //                        if changeColor == .white {
    //                            TickImage()
    //                        }
    //                    }
    //                }
    //
    //            }
    //
    //            Button(action: {
    //                print("\(nameProject)")
    //                let project = ProjectModel(color: changeColor, nameProject: nameProject)
    //                alert.projects.append(project)
    //                saveProject.append(project)
    //                if let data = try? encoder.encode(saveProject) {
    //                    protectsStore = data
    //                }
    //                alert.show.toggle()
    //            }) {
    //                Text("Done")
    //                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
    //                    .foregroundColor(FontStyleColors.colorWhite)
    //            }
    //            .frame(width: 295, height: 48)
    //            .background(FontStyleColors.colorRed)
    //            .cornerRadius(5)
    //        }
    //        .padding(.leading, 29)
    //        .frame(width: 327, height: 350)
    //        .background(FontStyleColors.colorWhite)
    //        .border(.green, width: 1)
    //    }
}

struct AddProjectAlert_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectAlert()
    }
}
