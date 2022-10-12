//
//  CalendarView.swift
//  TodoList
//
//  Created by Никита Коголенок on 7.10.22.
//

import SwiftUI

struct CalendarView: View {
    
    // MARK: - Varible
    @State var currentDate: Date = Date()
    
    // MARK: - Body
    var body: some View {
        
        VStack(spacing: 20) {
            CustomDatePicker(currentDate: $currentDate)
            
            Button("Done") {
                
            }
            .frame(width: 150, height: 48)
            .cornerRadius(5)
            .background(FontStyleColors.colorRed)
            .foregroundColor((FontStyleColors.colorWhite))
        }
        .frame(width: 344, height: 397)
        .cornerRadius(5)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
