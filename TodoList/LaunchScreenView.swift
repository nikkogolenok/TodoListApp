//
//  LaunchScreenView.swift
//  TodoList
//
//  Created by Никита Коголенок on 16.08.22.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        VStack {
            logoImage
            logoTextImage
        }
        .padding(15)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}

private extension LaunchScreenView {
    
    var logoImage: some View {
        Image("logoImage")
    }
    
    var logoTextImage: some View {
        Image("logoTextImage")
    }
}
