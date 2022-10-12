//
//  ProfileView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.09.22.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var image = UIImage()
    @State private var showSheet = false
    
    var body: some View {
        VStack(spacing: 24) {
            VStack {
                
                Image(systemName: "gearshape.fill")
                    .padding(.leading, 310)
                    .padding(.top, 10)
                
                HStack(spacing: 10) {
                    Image(uiImage: self.image)
                        .resizable()
                        .frame(width: 64, height: 64)
                        .cornerRadius(32)
                        .background(FontStyleColors.colorGray)
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .padding(.init(top: 28, leading: 0, bottom: 0, trailing: 0))
                        .onTapGesture {
                            showSheet = true
                        }
                        .sheet(isPresented: $showSheet) {
                            ImagePicker(sourseType: .photoLibrary, selectedImage: self.$image)
                        }
                    
                    VStack(alignment: .leading) {
                        Text("Stephen")
                        Text("pangcheo1210@gmail.")
                    }
                }
                .padding(.bottom, 30)
                .padding(.trailing, 50)
                
                HStack(spacing: 23) {
                    VStack(alignment: .leading) {
                        Text("120")
                        Text("Created Task")
                    }
                    
                    VStack(alignment: .leading) {
                        Text("80")
                        Text("Completed Tasks")
                    }
                }
                .padding(.bottom, 30)
            }
            .padding(.top, 24)
            .frame(width: 343, height: 190)
            .cornerRadius(5)
            
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1..<100) { i in
                            VStack(spacing: 7) {
                                Text("Events")
                                Text("12 Tasks")
                            }
                            .frame(width: 160, height: 100)
                            .background(.blue)
                        }
                    }
                }
            }
            .frame(width: 343, height: 100)
            
            VStack {
                Text("Statistic")
                    .padding(.trailing, 250)
                    .padding(.bottom, 22)
                
                HStack(spacing: 28) {
                    VStack {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                            Text("60%")
                                .foregroundColor(.red)
                        }
                        
                        Text("Events")
                    }
                    
                    VStack {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                            Text("40%")
                                .foregroundColor(.red)
                        }
                        
                        Text("To do")
                    }
                    
                    VStack {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                            Text("80%")
                                .foregroundColor(.red)
                        }
                        
                        Text("Quick Notes")
                    }
                }
            }
            .frame(width: 343, height: 205)
            .cornerRadius(5)
        }
        .padding(.top, 10)
        .offset(y: 20)
        
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Profile")
        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
//        .foregroundColor(.white)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
