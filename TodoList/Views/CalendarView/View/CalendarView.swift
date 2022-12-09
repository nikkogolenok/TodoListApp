//
//  CalendarView.swift
//  TodoList
//
//  Created by Никита Коголенок on 7.10.22.
//

import SwiftUI

@MainActor class ChangeDate: ObservableObject {
    @Published var changeDate: Date? = nil
}

struct CalendarView: View {
    
    @StateObject var date = ChangeDate()
    @State var currentDate: Date  = Date()
    
    @EnvironmentObject var selectDate: PersonAndProject

    
    var body: some View {
        
        VStack(spacing: 0){
        CustomDatePicker(currentDate: $currentDate)
                .padding(.bottom, 45)
                .padding(.top, 40)
                .environmentObject(date)
            
            Button {
                selectDate.selectedDate = date.changeDate
                selectDate.showCalendar.toggle()
            } label: {
                Text("Done")
            }
            .frame(width: 150, height: 48)
            .foregroundColor(.white)
            .background(Color(red: 0.976, green: 0.376, blue: 0.376))
            .cornerRadius(5)
            .padding(.bottom, 43)

        }
        .frame(width: 344, height: 397)
        .background(.white)
    }
}
//struct CalendarView: View {
//
//    // MARK: - Varible
//    @StateObject var date = ChangeDate()
//    @State var currentDate: Date = Date()
//
//    @EnvironmentObject var selectDate: PersonAndProject
//    // MARK: - Body
//    var body: some View {
//
//        VStack(spacing: 20) {
//            CustomDatePicker(currentDate: $currentDate)
//
//            Button("Done") {
//                selectDate.selectedDate = date.changeDate
//                selectDate.showCalendar.toggle()
//            }
//            .frame(width: 150, height: 48)
//            .background(FontStyleColors.colorRed)
//            .foregroundColor((FontStyleColors.colorWhite))
//            .cornerRadius(5)
//        }
//        .frame(width: 344, height: 397)
//        .cornerRadius(5)
//    }
//}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
