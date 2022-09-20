//
//  MenuView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.09.22.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Image("circleBlue")
                        .padding(.vertical, 40)
                    VStack {
                        Text("Personal")
                        Text("10 Tasks")
                    }
                }
                .background(Color.blue)
                
                VStack(alignment: .leading) {
                    Image("circleRed")
                        .padding(.vertical, 40)
                    VStack {
                        Text("Personal")
                        Text("10 Tasks")
                    }
                }
                .background(Color.blue)
            }
            
            HStack {
                VStack(alignment: .leading) {
                    Image("circleGreen")
                        .padding(.vertical, 40)
                    VStack {
                        Text("Personal")
                        Text("10 Tasks")
                    }
                }
                .background(Color.blue)
                
                VStack(alignment: .leading) {
                    Image("circleViolet")
                        .padding(.vertical, 40)
                    VStack {
                        Text("Personal")
                        Text("10 Tasks")
                    }
                }
                .background(Color.blue)
            }
        }
        .offset(y: -150)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Projects")
        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
        .foregroundColor(.white)
    }}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
