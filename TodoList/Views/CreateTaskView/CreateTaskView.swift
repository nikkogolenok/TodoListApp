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
//        NavigationView {
            
            ZStack {
                VStack {
                    Rectangle()
                        .frame(height: 44)
                        .foregroundColor(FontStyleColors.colorRed)
                    
                    Spacer()
                    
                    Rectangle()
                        .frame(height: 90)
                        .foregroundColor(FontStyleColors.colorBar)
                }
                .edgesIgnoringSafeArea(.bottom)
                
                
                ZStack {
                    VStack {
                        
                        HStack(spacing: 51) {
                            HStack(alignment: .center, spacing: 8) {
                                Text("For")
                                
                                ZStack {
                                    Rectangle()
                                        .frame(width: 90, height: 48)
                                        .cornerRadius(50)
                                        .foregroundColor(.gray)
                                    Text("Assignee")
                                }
                            }
                            
                            HStack(alignment: .center, spacing: 8) {
                                Text("In")
                                ZStack {
                                    Rectangle()
                                        .frame(width: 90, height: 48)
                                        .cornerRadius(50)
                                        .foregroundColor(.gray)
                                    Text("Project")
                                }
                            }
                        }
        
                        ZStack {
                            Rectangle()
                                .frame(width: 343, height: 66)
                                .foregroundColor(.gray)
                            Text("Title")
                                .padding(.trailing, 282)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Description")
                            
                            ZStack {
                                Rectangle()
                                    .frame(width: 295, height: 120)
                                    .padding(.bottom, 75)
                                
                                
                                
                                Rectangle()
                                    .frame(width: 295, height: 48)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.bottom, 24)
                        
                        ZStack {
                            Rectangle()
                                .frame(width: 343, height: 66)
                                .foregroundColor(.gray)
                            HStack {
                                Text("Due Date")
                                
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
                        
                                                
                        VStack(alignment: .leading) {
                            Text("Add Member")
                            
                            HStack {
                                ZStack {
                                    Rectangle()
                                        .frame(width: 90, height: 48)
                                        .cornerRadius(50)
                                        .foregroundColor(.gray)
                                    
                                    Text("Anyone")
                                }
                                
                                ZStack {
                                    Circle()
                                        .frame(width: 31, height: 31)
                                        .foregroundColor(.gray)
                                    
                                    Text("+")
                                }
                            }
                            
                            Button("Add Task") {
                                
                            }
                            .frame(width: 295, height: 48)
                            .cornerRadius(5)
                            .background(.red)
                        }
                    }
                        
                    .frame(width: 343, height: 669)
                    .cornerRadius(5)
                    .background(.white)
                    .offset(y: -18)
                }
                
                if showCalendavView {
                    GeometryReader { _ in
                        CalendarView()
                            .cornerRadius(5)
                            .padding(.horizontal, 16)
                            .padding(.top, 127)
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
