//
//  CalendarWonthView.swift
//  TodoList
//
//  Created by Никита Коголенок on 7.10.22.
//

import SwiftUI

struct CalendarWonthView: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        CustomDatePicker(currentDate: $currentDate)
            .frame(width: 375, height: 327)
    }
}

struct CalendarWonthView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarWonthView()
    }
}
