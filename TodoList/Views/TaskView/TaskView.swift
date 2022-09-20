//
//  TaskView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.09.22.
//

import SwiftUI

struct TaskView: View {
    var body: some View {
        GeometryReader { geometry in
            HStack {
                NavigationLink("Today") {
                    TodayView()
                }
                .frame(width: geometry.size.width/2, height: 50)
                
                
                NavigationLink("Month") {
                    MonthView()
                }
                .frame(width: geometry.size.width/2, height: 50)
            }
            .background(FontStyleColors.colorRed)
            .edgesIgnoringSafeArea(.top)
        }
        
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
               Image(systemName: "slider.horizontal.3")
                    .resizable()
            }
        }
        .navigationTitle("Work List")
        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
        .foregroundColor(.white)
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
