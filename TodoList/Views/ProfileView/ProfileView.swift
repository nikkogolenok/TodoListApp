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
                
//                Image(systemName: "gearshape.fill")
//                    .padding(.leading, 310)
//                    .padding(.top, 10)
                
                HStack(spacing: 10) {
                    Image("1")
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
                        Text("Stephen Chow")
                            .font(.custom(FontsStyleManager.Roboto.medium, size: 18))
                            .foregroundColor(.gray)
                        Text("pangcheo1210@gmail")
                            .font(.custom(FontsStyleManager.Roboto.medium, size: 18))
                            .foregroundColor(.gray)
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
                .padding(.bottom, 40)
                .font(.custom(FontsStyleManager.Roboto.medium, size: 18))
                .foregroundColor(.gray)
            }
            .padding(.top, 24)
            .frame(width: 343, height: 190)
            .cornerRadius(5)
            
            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        VStack(alignment: .leading, spacing: 7) {
                                Text("Events")
                                .padding(.trailing, 85)
                                .font(.custom(FontsStyleManager.Roboto.medium, size: 18))
                                .foregroundColor(.white)
                                Text("12 Tasks")
                                .font(.custom(FontsStyleManager.Roboto.medium, size: 18))
                                .foregroundColor(.white)
                            }
                            .frame(width: 160, height: 100)
                            .padding(.trailing, 5)
                            .background(FontStyleColors.colorRed)
                            .cornerRadius(5)
                        
                        VStack(alignment: .leading, spacing: 7) {
                                Text("To do Task")
                                .padding(.trailing, 53)
                                .font(.custom(FontsStyleManager.Roboto.medium, size: 18))
                                .foregroundColor(.white)
                                Text("12 Tasks")
                                .font(.custom(FontsStyleManager.Roboto.medium, size: 18))
                                .foregroundColor(.white)
                            }
                            .frame(width: 160, height: 100)
                            .padding(.trailing, 5)
                            .background(FontStyleColors.colorAddProject)
                            .cornerRadius(5)
                        
                        VStack(alignment: .leading, spacing: 7) {
                                Text("To do Task")
                                .padding(.trailing, 53)
                                .font(.custom(FontsStyleManager.Roboto.medium, size: 18))
                                .foregroundColor(.white)
                                Text("12 Tasks")
                                .font(.custom(FontsStyleManager.Roboto.medium, size: 18))
                                .foregroundColor(.white)
                            }
                            .frame(width: 160, height: 100)
                            .padding(.trailing, 5)
                            .background(.purple)
                            .cornerRadius(5)
                    }
                }
            }
            .frame(width: 343, height: 100)
            
            VStack {
                Text("Statistic")
                    .foregroundColor(Color(red: 0.192, green: 0.192, blue: 0.192))
                    .padding(.trailing, 250)
                    .padding(.bottom, 22)
                
                HStack(spacing: 28) {
                    VStack {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                                .border(.gray, width: 1)
                                .cornerRadius(40)
                            Text("60%")
                                .foregroundColor(.gray)
                        }
                        
                        Text("Events")
                    }
                    
                    VStack {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                                .border(.gray, width: 1)
                                .cornerRadius(40)
                            Text("40%")
                                .foregroundColor(.gray)
                        }
                        
                        Text("To do")
                    }
                    
                    VStack {
                        ZStack {
                            Circle()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.white)
                                .border(.gray, width: 1)
                                .cornerRadius(40)
                            Text("80%")
                                .foregroundColor(.gray)
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
