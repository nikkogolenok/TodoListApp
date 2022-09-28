//
//  OnboardingView.swift
//  TodoList
//
//  Created by Никита Коголенок on 16.08.22.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Variables
    @State private var currentIndex = 0
    private let screens: [OnboardView] = [
        OnboardView(imageName: "onbordingImageFirst",
                    title: "Welcom to todo list",
                    description: "Whats going to happen tomarrow?"),
        
        OnboardView(imageName: "onbordingImageSecond",
                    title: "Work happens",
                    description: "Get notified when work happens."),
        
        OnboardView(imageName: "onbordingImageThird",
                    title: "Tasks and assign",
                    description: "Task and assign them to colleagues.")
    ]
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TabView(selection: $currentIndex.animation()) {
                    ForEach(0..<screens.count, id: \.self) { index in
                        screens[index]
                            .id(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(.page(backgroundDisplayMode: .never))
                .overlay(Fancy3DotsIndexView(numberOfPages: screens.count, currentIndex: currentIndex))
                
                ZStack {
                    switch currentIndex {
                    case 0:
                        Image("groupOne")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 438, height: 322)
                    case 1:
                        withAnimation {
                            Image("groupTwo")
                                .resizable()
                                .ignoresSafeArea()
                                .frame(width: 438, height: 322)
                        }
                    case 2:
                        Image("groupThree")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 438, height: 322)
                    default:
                        Image("groupOne")
                            .resizable()
                            .ignoresSafeArea()
                            .frame(width: 438, height: 322)
                    }
                    NavigationLink("Get Started") {
                        SignUpView()
                    }
                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                    .frame(width: 293, height: 48)
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(5)
                    .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, x: 0, y: 4)
                    .padding(.init(top: 31, leading: 0, bottom: 0, trailing: 0))
                }
            }
            .offset(y: 0)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
