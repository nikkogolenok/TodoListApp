//
//  OnboardingView.swift
//  TodoList
//
//  Created by Никита Коголенок on 16.08.22.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            OnboardView(imageName: "onbordingImageFirst",
                        title: "Welcom to todo list",
                        description: "Whats going to happen tomarrow?",
                        imageNameBottom: "groupOne",
                        bottonName: "Get Started")
            
            OnboardView(imageName: "onbordingImageSecond",
                        title: "Work happens",
                        description: "Get notified when work happens.",
                        imageNameBottom: "groupTwo",
                        bottonName: "Get Started")
            
            OnboardView(imageName: "onbordingImageThird",
                        title: "Tasks and assign",
                        description: "Task and assign them to colleagues.",
                        imageNameBottom: "groupThree",
                        bottonName: "Get Started")
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea(.container, edges: .all)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct OnboardView: View {
    
    let imageName: String
    let title: String
    let description: String
    let imageNameBottom: String
    let bottonName: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .frame(width: 305, height: 252)
                .padding(.init(top: 108, leading: 35, bottom: 50, trailing: 35))
            
            Text(title)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 24))
                .padding(.init(top: 0, leading: 0, bottom: 11, trailing: 0))
            
            Text(description)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 19))
                .opacity(0.8)
            
            ZStack {
                Image(imageNameBottom)
                    .resizable()
                    .ignoresSafeArea()
                    .frame(width: 438, height: 322)
                
                Button(bottonName) {
                    print("1")
                }
                .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                .frame(width: 293, height: 48)
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(5)
                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, x: 0, y: 4)
                .padding(.init(top: 31, leading: 0, bottom: 0, trailing: 0 ))
            }
        }
    }
}
