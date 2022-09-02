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
                .ignoresSafeArea(.container, edges: .all)
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
        }
    }
}

struct OnboardView: View {
    
    // MARK: - Variables
    @State private var navigate = false
    
    let imageName: String
    let title: String
    let description: String
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 0) {
            Image(imageName)
                .frame(width: 305, height: 252)
                .padding(.init(top: 108, leading: 35, bottom: 0, trailing: 35))
                .ignoresSafeArea()
            Spacer()
            Text(title)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 24))
                .foregroundColor(FontsStyleManager.Roboto.colorThin)
                .padding(.init(top: 0, leading: 0, bottom: 11, trailing: 0))
            
            Text(description)
                .font(.custom(FontsStyleManager.Roboto.thin, size: 19))
                .foregroundColor(FontsStyleManager.Roboto.colorMedium)
                .opacity(0.8)
            Spacer()
        }
        .offset(y: -150)
    }
}



struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}

struct Fancy3DotsIndexView: View {
    
    // MARK: - Variables
    let numberOfPages: Int
    let currentIndex: Int
    
    private let circleSize:    CGFloat = 8
    private let circleSpacing: CGFloat = 8
    
    private let primaryColor = Color.black
    private let secondaryColor = Color.black.opacity(0.2)
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: circleSpacing) {
            ForEach(0..<numberOfPages, id: \.self) { index in
                Circle()
                    .fill(currentIndex == index ? primaryColor : secondaryColor)
                    .scaleEffect(1)
                    .frame(width: circleSize, height: circleSize)
                    .id(index)
            }
        }
        .offset(y: -50)
        .padding(.init(top: 450, leading: 0, bottom: 0, trailing: 0))
    }
}
