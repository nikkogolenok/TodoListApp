//
//  CustomNavigationView.swift
//  TodoList
//
//  Created by Никита Коголенок on 14.10.22.
//

import SwiftUI

struct CustomNavigationView: View {
    var body: some View {
        VStack {
            headerView()
            Spacer()
        }
        
        
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView()
    }
}



func headerView() -> some View {
    
    ZStack {
        VStack {
            VStack {
                HStack(spacing: 100) {
                    
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 20, height: 21)
                        .padding(.leading, 28)
                    
                    Text("Work List")
                        .foregroundColor(.white)
    
                    Spacer()
    
                }
                .padding(.bottom, 72)
            }
        }
    }
    .frame(width: 375, height: 151)
    .padding(.horizontal, 0)
    .background(FontStyleColors.colorRed)
}

//ZStack {
//    VStack {
//        VStack {
//            HStack(spacing: 100) {
//                Spacer()
//                Text("Work List")
//                    .foregroundColor(.white)
//
//                Image(systemName: "slider.horizontal.3")
//                    .resizable()
//                    .foregroundColor(.white)
//                    .frame(width: 20, height: 21)
//                    .padding(.trailing, 28)
//
//            }
//            .padding(.top, 25)
//
//
//
//        }
//    }
//}
