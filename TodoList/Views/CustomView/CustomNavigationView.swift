//
//  CustomNavigationView.swift
//  TodoList
//
//  Created by Никита Коголенок on 14.10.22.
//

import SwiftUI

struct CustomNavigationView: View {
    var title: String
    
    var body: some View {
        VStack {
            HeaderView(title: title)
        }
    }
}

struct CustomNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavigationView(title: "New Task")
    }
}

struct HeaderView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var dismissView = false
    var title: String
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    HStack(spacing: 100) {
                        
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 20, height: 21)
                            .padding(.leading, 28)
                            .onTapGesture {
                                self.dismissView.toggle()
                                presentationMode.wrappedValue.dismiss()
                            }
                        
                        Text(title)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .lineLimit(1)
                        Spacer()
                    }
                    .padding(.bottom, 48)
                }
            }
        }
        .frame(width: 375, height: 107)
        .padding(.horizontal, 0)
        .background(FontStyleColors.colorRed)
    }
}

