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
        .tabViewStyle(.page(indexDisplayMode: .always))
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
                .padding(40)
            
            Text(title)
                .frame(width: 206, height: 28)
                .foregroundColor(Color(red: 0.192, green: 0.192, blue: 0.192, opacity: 1))
            
            Text(description)
                .frame(width: 277, height: 21)
                .foregroundColor(Color(red: 0.192, green: 0.192, blue: 0.192, opacity: 1))
            
            ZStack {
                Image(imageNameBottom)
                    .resizable()
                    .scaledToFit()
                
                Button(bottonName) {
                    print("1")
                }
                .font(.system(size: 18, design: .default))
                .foregroundColor(Color.black)
                .frame(width: 293, height: 48)
                .background(Color(red: 255, green: 255, blue: 255, opacity: 1))
                .cornerRadius(5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}
