//
//  CreateTaskView.swift
//  TodoList
//
//  Created by Никита Коголенок on 6.10.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct CreateTaskView: View {
    
    // MARK: - Variables
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var image = UIImage()
    @State var showCalendavView = false
    
    // MARK: - Body
    var body: some View {
            
            ZStack {
                VStack {
                    Rectangle()
                        .frame(height: 44)
                        .foregroundColor(FontStyleColors.colorRed)
                    
                    Spacer()
                    
//                    Rectangle()
//                        .frame(height: 90)
//                        .foregroundColor(FontStyleColors.colorBar)
                    
                    TabBarView(viewRouter: ViewRouter())
                }
                .edgesIgnoringSafeArea(.bottom)
                
                
                ZStack {
                    VStack {
                        
                        HStack(spacing: 51) {
                            RectangularAndText(text: "For", textInRectangular: "Assignee")
                            RectangularAndText(text: "In", textInRectangular: "Project")
                        }
                        .padding(.top, 32)
        
                        ZStack {
                            Rectangle()
                                .frame(width: 343, height: 66)
                                .foregroundColor(FontStyleColors.colorGray)
                            Text("Title")
                                .padding(.leading, 24)
                                .padding(.trailing, 282)
                        }
                        .padding(.top, 24)
                        
                        VStack(alignment: .leading) {
                            Text("Description")
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: 295, height: 120)
                                    .foregroundColor(.white)
                                
                                ZStack {
                                    Rectangle()
                                        .frame(width: 295, height: 48)
                                        .foregroundColor(FontStyleColors.colorGray)
                                        .border(Color(red: 0.917, green: 0.917, blue: 0.917), width: 1)
                                    .padding(.top, 75)
                                    
                                    Image(systemName: "paperclip")
                                        .frame(width: 20, height: 21)
                                        .padding(.top, 85)
                                        .padding(.leading, 16)
                                        .padding(.trailing, 260)
                                        //.foregroundColor(.red)
                                    
                                }
                            }
                            .border(Color(red: 0.917, green: 0.917, blue: 0.917), width: 1)
                            .cornerRadius(5)
                        }
                        .padding(.top, 16)
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 343, height: 66)
                                .foregroundColor(FontStyleColors.colorGray)
                            HStack {
                                Text("Due Date")
                                    .padding(.leading, 24)
                                ZStack {
                                    Rectangle()
                                        .frame(width: 90, height: 32)
                                        .cornerRadius(5)
                                        .foregroundColor(.blue)
                                    Text("Anytime")
                                        .foregroundColor(.white)
                                        .onTapGesture {
                                            self.showCalendavView.toggle()
                                        }
                                }
                            }
                            .padding(.trailing, 150)
                        }
                        .padding(.top, 24)
                        
                                                
                        VStack(alignment: .leading) {
                            Text("Add Member")
                            
                            HStack {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 90, height: 48)
                                        .cornerRadius(50)
                                        .foregroundColor(FontStyleColors.colorGray)
                                    
                                    Text("Anyone")
                                }
                                
                                ZStack {
                                    Circle()
                                        .frame(width: 31, height: 31)
                                        .foregroundColor(FontStyleColors.colorGray)
                                    
                                    Text("+")
                                        .foregroundColor(.white)
                                }
                            }
                            
                            Button("Add Task") {
                                
                            }
                            .frame(width: 295, height: 48)
                            .background(FontStyleColors.colorRed)
                            .foregroundColor(FontStyleColors.colorWhite)
                            .cornerRadius(5)
                            
                            Spacer()
                        }
                        .padding(.top, 24)
                    }
                        
                    .frame(width: 343, height: 669)
                    .background(.white)
                    .cornerRadius(5)
                    .offset(y: -18)
                }
                
                if showCalendavView {
                    GeometryReader { _ in
                        CalendarView()
                            .frame(width: 344, height: 397)
                            .cornerRadius(5)
                            .padding(.horizontal, 16)
                            //.padding(.top, 127)
                            .background(.white)
                    }
                    .background(
                        Color.black.opacity(0.5)
                            .onTapGesture {
                                self.showCalendavView.toggle()
                            })
                }

            }
        
        
            .edgesIgnoringSafeArea(.bottom)
            .navigationTitle("New Task")
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
struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView()
    }
}
