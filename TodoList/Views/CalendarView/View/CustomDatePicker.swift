//
//  CustomDatePicker.swift
//  TodoList
//
//  Created by Никита Коголенок on 7.10.22.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @Binding var currentDate: Date
    
    @State var currentMounth: Int = 0
    @EnvironmentObject var date: ChangeDate
    
    var body: some View {
        
        VStack(spacing: 18) {
            
            let days: [String] = ["M", "T", "W", "T", "F", "S", "S"]
            
//            HStack(spacing: 20) {
//                
//
//                Button {
//                    currentMounth -= 1
//                } label: {
//                    Image(systemName: "chevron.left")
//                        .font(.custom(FontsStyleManager.Roboto.thin, size: 16))
//                        .foregroundColor(.gray)
//                }
//                .padding(.trailing, 25)
//
//                VStack(alignment: .leading, spacing: 10) {
//                    Text("\(extraDate()[1].uppercased()) \(extraDate()[0])")
//                        .font(.custom(FontsStyleManager.Roboto.thin, size: 20))
//                }
////                Spacer(minLength: 0)
//
//
//                Button {
//                    withAnimation {
//                        currentMounth += 1
//                    }
//                } label: {
//                    Image(systemName: "chevron.right")
//                        .font(.custom(FontsStyleManager.Roboto.thin, size: 16))
//                        .foregroundColor(.gray)
//                }
//                .padding(.leading, 25)
//
//
//            }
//            .padding(.horizontal)
            
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    
                    Text(day)
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 16))
                        .frame(maxWidth: .infinity)
                    
                }
            }
            
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(extractDate()) { value in
                    CardView(value: value)
                        .background(
                        
                            Rectangle()
                                .fill(isToday(date: value.date) ? Color(red: 0.376, green: 0.455, blue: 0.976) : Color.white)
                                .onTapGesture {
                                    currentDate = value.date
                                    date.changeDate = currentDate
                                }
                        )
                        .frame(width: 26, height: 26)
                        .cornerRadius(15)
                        .foregroundColor(isToday(date: value.date) ? .white : .black)
                }
            }
        }
        .onChange(of: currentMounth) { newValue in
            currentDate = getCurrentMounth()
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue)-> some View {
        VStack {
            if value.day !=  -2  {
                Text("\(value.day)")
                    .font(.custom(FontsStyleManager.Roboto.medium, size: 14))
                    .frame( maxWidth: .infinity)
            }
        }
        .padding(.vertical, 5)
        
    }
    
    func isToday(date: Date)  -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(currentDate, inSameDayAs: date)
    }
    
    func extraDate() -> [String] {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM "
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func extractDate() -> [DateValue] {
        
        let calendar = Calendar.current
        
        let currentMounth = getCurrentMounth()
        
        var days =  currentMounth.getAllDates().compactMap { date -> DateValue in
            
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 2 {
            days.insert(DateValue(day: -2, date: Date()), at: 0)
          
        }
        return days
    }
    
    func getCurrentMounth() -> Date {
        let calendar = Calendar.current
        
        
        guard let currentMounth = calendar.date(byAdding: .month, value: self.currentMounth, to: Date()) else {
            return Date()
        }
        return currentMounth
    }
}
    
    
    struct CustomDatePicker_Previews: PreviewProvider {
        static var previews: some View {
            CalendarView()
        }
    }
    
    extension Date {
        
        func getAllDates() -> [Date] {
            
            let calendar = Calendar.current
            
            let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
            
            let range = calendar.range(of: .day, in: .month, for: self)!
            
            
            return range.compactMap { day -> Date in
                
                return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
            }
        }
    }
