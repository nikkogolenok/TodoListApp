//
//  TaskFullView.swift
//  TodoList
//
//  Created by Никита Коголенок on 10.10.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct TaskFullView: View {
    
    // MARK: - Variables
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var image = UIImage()
    @State var showCalendavView = false
    @State private var showSheet = false
    @State private var showAlert = false
    @State private var dismissView = false
    @StateObject var viewRouter = ViewRouter()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                Rectangle()
                    .foregroundColor(FontStyleColors.colorRed)
                
                Rectangle()
                    .frame(height: 90)
                    .foregroundColor(FontStyleColors.colorBar)
            }
            .edgesIgnoringSafeArea(.bottom)
            
            
            ZStack {
                VStack(spacing: 25) {
                    VStack {
                        HStack {
                            Image(systemName: "xmark")
                                .padding(.leading, 16)
                                .onTapGesture {
                                    self.dismissView.toggle()
                                    presentationMode.wrappedValue.dismiss()
                                }
                            Spacer()
                            Image(systemName: "gearshape.fill")
                                .padding(.trailing, 16)
                                .onTapGesture {
                                    self.showAlert.toggle()
                                }
                        }
                    }
//                    .padding(.bottom, 24)
                    
                    Text("Meeting according with design team in Central Park")
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .top, spacing: 12) {
                            
                            Image(uiImage: self.image)
                                .resizable()
                                .frame(width: 44, height: 44)
                                .cornerRadius(22)
                                .background(FontStyleColors.colorGray)
                                .aspectRatio(contentMode: .fill)
                                .clipShape(Circle())
                                .onTapGesture {
                                    showSheet = true
                                }
                                .sheet(isPresented: $showSheet) {
                                    ImagePicker(sourseType: .photoLibrary, selectedImage: self.$image)
                                }
                            
                            VStack(alignment: .leading) {
                                Text("Assigned to")
                                Text("Stephen Chow")
                            }
                        }
                        
                        Rectangle()
                            .frame(width: 295, height: 2)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .top, spacing: 12) {
                            
                            Image("smallCalender")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .cornerRadius(9)
                                .padding(.leading, 10)
                                .padding(.trailing, 15)
                        
                        
//                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("Due Date")
                                Text("Aug5,2018")
                            }
                        }
                        
                        Rectangle()
                            .frame(width: 295, height: 2)
                    }

                    VStack(alignment: .leading) {
                        HStack(alignment: .top, spacing: 12) {
                            
                            Image("smallCalender")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .cornerRadius(9)
                                .padding(.leading, 10)
                                .padding(.trailing, 15)
                        
                        
//                                .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text("Description")
                                Text("Loren ipsum doro sit amet.")
                            }
                        }
                        
                        Rectangle()
                            .frame(width: 295, height: 2)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .top, spacing: 12) {
                            
                            Image("persons")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .cornerRadius(9)
                                .padding(.leading, 10)
                                .padding(.trailing, 15)
                            
                            VStack(alignment: .leading) {
                                Text("Members")
                                
                                HStack {
                                    ForEach(1..<5) { i in
                                        Circle()
                                            .frame(width: 32, height: 32)
                                    }
                                }
                            }
                        }
                        
                        Rectangle()
                            .frame(width: 295, height: 2)
                    }
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .top, spacing: 12) {
                            
                            Image("smallCalender")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .cornerRadius(10)
                                .padding(.leading, 19)
                                .padding(.trailing, 15)
                            
                            VStack(alignment: .leading) {
                                Text("Tag")
                                
                                ZStack {
                                    Rectangle()
                                        .frame(width: 90, height: 40)
                                        .foregroundColor(.white)
                                        .border(.gray, width: 1)
                                        .cornerRadius(5)
                                    
                                    Text("Person")
                                }
                                .padding(.trailing, 175)
                            }
                        }
                    }
                    
                    VStack {
                        Button("Complete Task") {
                            
                        }
                        .frame(width: 295, height: 48)
                        .background(Color(red: 0.376, green: 0.455, blue: 0.976))
                        .cornerRadius(5)
                        .foregroundColor(.white)
                        
                        
                        HStack(spacing: 21) {
                            Button("Comment") {
                                
                            }
                            .foregroundColor(.black)

                            VStack {
                                Image(systemName: "chevron.down")
                                    .frame(width: 12, height: 6)
                                Image(systemName: "chevron.down")
                            }
                        }
                    }
                }
                
                
                if showAlert {
                    GeometryReader { _ in
                        AlertFilterView(firstText: "Add Member", secondText: "Edit Task", thirdText: "Delete Task")
                            .cornerRadius(5)
                            .padding(.leading, 100)
                            .padding(.top, 100)
                    }
                    .background(
                        Color.black.opacity(0.65)
                            .onTapGesture {
                                withAnimation {
                                    self.showAlert.toggle()
                                }
                            }
                    )

                }
                
                if dismissView {
                    GeometryReader { _ in
                        WorkListView(viewRouter: viewRouter)
                    }
                }
            }
            .frame(width: 343, height: 716)
            .background(.white)
            .cornerRadius(5)
            .offset(y: -10)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(
            FontStyleColors.colorRed,
            for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

@available(iOS 16.0, *)
struct TaskFullView_Previews: PreviewProvider {
    static var previews: some View {
        TaskFullView()
    }
}
