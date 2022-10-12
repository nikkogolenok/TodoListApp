//
//  SplashScreenView.swift
//  TodoList
//
//  Created by Никита Коголенок on 29.08.22.
//

import SwiftUI

@available(iOS 16.0, *)
struct SplashScreenView: View {
    
    // MARK: - Variables
    @State private var isActive = false
    @State private var size = 0.4
    @State private var opacity = 0.3
    
    // MARK: - Body
    var body: some View {
        
        if isActive {
            OnboardingView()
        } else {
            VStack {
                Spacer()
                VStack(spacing: 15) {
                    
                    Image("logoImage")
                    Image("logoTextImage")
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.4)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
                Spacer()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

@available(iOS 16.0, *)
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
