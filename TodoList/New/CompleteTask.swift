//
//  CompleteTaskView.swift
//  ToDoList
//
//  Created by Alex Paramonov on 25.10.22.
//

import SwiftUI

struct CompleteTaskView: View {
    
    @State private var showComment = false
    @State private var comment = ""
    @State private var showSettings = false
    @StateObject var viewRouter = ViewRouter()
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                VStack {
                    
                    Color("redColor")
                }
                
                VStack {
                    
                    Color("barColor")
                }
                .frame(height: 100)
                .padding(.top, -10)
            }
            .ignoresSafeArea()
            
            GeometryReader {_ in
                
                ZStack {
                    Color(.white)
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        VStack {
                            
                                HStack {
                                   
                                    NavigationLink {
                                        if #available(iOS 16.0, *) {
                                            TabBarView(viewRouter: viewRouter)
                                        } else {
                                            // Fallback on earlier versions
                                        }
                                    } label: {
                                        Image(systemName: "xmark")
                                        .font(.custom(FontsStyleManager.Roboto.medium, size: 23))
                                        .padding(.leading, 16)
                                        .padding(.top, 16)
                                        .foregroundColor(.black)
                                    }
                                    
                                    Spacer()
                                    
                                    Image(systemName: "gearshape.fill")
                                        .font(.custom(FontsStyleManager.Roboto.medium, size: 23))
                                        .padding(.trailing, 16)
                                        .padding(.top, 16)
                                        .onTapGesture {
                                            self.showSettings.toggle()
                                        }
                                }
                                
                                Text("Meeting according with design in team Central Park")
                                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                                    .offset(x: -18)
                                    .padding(.top, 24)
                                    .padding(.trailing, 13)
                                
                            Group {
                                
                                
                                AssignedView()
                                    .padding(.leading,24)
                                    .padding(.top, 24)
                                
                                Rectangle()
                                    .frame(width: 340, height: 2)
                                    .foregroundColor(Color(red: 0.892, green: 0.892, blue: 0.892))
                                    .padding(.top, 9)
                                
                                
                                DateView()
                                    .padding(.top, 12)
                                
                                Rectangle()
                                    .frame(width: 340, height: 2)
                                    .foregroundColor(Color(red: 0.892, green: 0.892, blue: 0.892))
                                    .padding(.top, 9)
                                
                                DescriptionView()
                                
                                Rectangle()
                                    .frame(width: 340, height: 2)
                                    .foregroundColor(Color(red: 0.892, green: 0.892, blue: 0.892))
                                    .padding(.top, 9)
                                
                                MembersView()
                                
                                Rectangle()
                                    .frame(width: 340, height: 2)
                                    .foregroundColor(Color(red: 0.892, green: 0.892, blue: 0.892))
                                    .padding(.top, 9)
                                
                                TagView()
                                  
                                VStack (spacing: 16) {
                                    
                                    if showComment {
                                        VStack {

                                            TextField("Write a comment", text: $comment) {
                                            }
                                            .padding(.leading,20)
                                            .padding(.top,10)
                                            .onChange(of: comment ) { value in
                                                if value.count > 256 {
                                                    self.comment = String(value.prefix(256))
                                                }
                                            }
                                            HStack{

                                                Image("picture")
                                                    .resizable()
                                                    .frame(width: 20, height: 20)
                                                    .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                                    .padding(.leading, 16)

                                                Image(systemName: "paperclip")
                                                    .resizable()
                                                    .frame(width: 19, height: 20)
                                                    .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                                    .padding(.leading, 16)

                                                Spacer()

                                                Button {

                                                } label: {
                                                    Text("Send")
                                                        .font(.custom(FontsStyleManager.Roboto.thin, size: 16))
                                                }
                                                .padding(.trailing, 24)


                                            }
                                            .frame(width: 295, height: 48)
                                            .border(Color("silverColor"))
                                            .background(Color("silverColor"))
                                            .padding(.top, 38)
                                            Spacer()
                                        }
                                        .frame(width: 295, height: 120)
                                        .border(Color("silverColor"))
                                        .cornerRadius(5)
                                        .padding(.bottom, 24)
                                    }
                                    
                                    Button {
                                        
                                    } label: {
                                        Text("Complete Task")
                                            .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                                            .foregroundColor(.white)
                                            
                                    }
                                    .frame(width: 295, height: 48)
                                    .background(Color("blueColor"))
                                    .cornerRadius(5)
                                    
                                    if !showComment {
                                        
                                        HStack(spacing: 21) {
                                            
                                            Text("Comment")
                                                .font(.custom(FontsStyleManager.Roboto.thin, size: 17))
                                            
                                            Image("arrowDown")
                                                .resizable()
                                                .frame(width: 12, height: 12)
                                        }
                                        .onTapGesture {
                                            self.showComment.toggle()
                                        }
                                    }
                                }
                                .padding(.top, 40)
                            }
                                Spacer()
                            
                        }
                        
                    }
                }
                .frame(width: 399, height: 786)
                .padding(.leading, 16)
                .cornerRadius(5)
                .offset(y: 40)
                
            }
            .background(
                Color(.black).opacity(0.5)
            )
            
            if showSettings {
                GeometryReader { _ in
                    SettingAlert()
                        .padding(.leading, 170)
                        .offset(y: 100)

                }
                .background(
                    Color(.black).opacity(0.5)
                        .onTapGesture(perform: {
                            self.showSettings.toggle()
                        })

                        .ignoresSafeArea()
                )

            }
        }
        .navigationBarBackButtonHidden(true)
        
    }
}

struct CompleteTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteTaskView()
    }
}
