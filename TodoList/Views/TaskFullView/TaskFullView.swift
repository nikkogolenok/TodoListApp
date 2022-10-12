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
                    HStack {
                        Image(systemName: "xmark")
                            .padding(.leading, 16)
                        Spacer()
                        Image(systemName: "gearshape.fill")
                            .padding(.trailing, 16)
                            .onTapGesture {
                                self.showAlert.toggle()
                            }
                    }
                    
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
                                .frame(width: 18, height: 18)
                                .cornerRadius(9)
                        
                        
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
                                .frame(width: 18, height: 18)
                                .cornerRadius(9)
                        
                        
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
                            
                            Image("smallCalender")
                                .resizable()
                                .frame(width: 18, height: 18)
                                .cornerRadius(9)
                            
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
                                .frame(width: 18, height: 18)
                                .cornerRadius(9)
                            
                            VStack(alignment: .leading) {
                                Text("Members")
                                
                                ZStack {
                                    Rectangle()
                                        .frame(width: 90, height: 40)
                                        .cornerRadius(5)
                                        .foregroundColor(.white)
                                        .border(.gray, width: 1)
                                    
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
                        .cornerRadius(5)
                        .background(.blue)
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
                            .padding(.leading, 50)
                            .padding(.top, 30)
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
            }
            .frame(width: 343, height: 716)
            .background(.white)
            .offset(y: -10)
        }
        .edgesIgnoringSafeArea(.bottom)
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
struct TaskFullView_Previews: PreviewProvider {
    static var previews: some View {
        TaskFullView()
    }
}
