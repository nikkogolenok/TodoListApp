//
//  CustomDatePicker.swift
//  TodoList
//
//  Created by Никита Коголенок on 7.10.22.
//

import SwiftUI

struct CustomDatePicker: View {
    
    @Binding var currentDate: Date
    // Month update on arrow button clicks...
    @State var currentMonth: Int = 0
    // MARK: Current Day
    var currentDay: Date = Date()
    
    
    var body: some View {
        
        VStack(spacing: 5) {
            
            
            
            // Days...
            let days: [String] = ["M", "T", "W", "T", "F", "S", "S"]
            
            HStack {
                Text(extraDate()[1])
                Text(extraDate()[0])
            }
            
            // Day View...
            HStack(spacing: 0) {
                ForEach(days, id: \.self) { day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
            
            // Dates...
            // Lazy Grid...
            let columns = Array(repeating: GridItem(.flexible()), count: 7)
            
            LazyVGrid(columns: columns, spacing: 15) {
                
                ForEach(extractDate()) { value in
                    cardView(value: value)
                        .background(
                            Capsule()
                                .fill(isToday(date: value.date) ? Color.blue : Color.white)
                                .padding(.horizontal, 8)
                        )
                        .foregroundColor(isToday(date: value.date) ? .white : .black)
                        .onTapGesture {
                            currentDate = value.date
                        }
                }
            }
        }
        .onChange(of: currentMonth) { newValue in
            // updating Month...
            currentDate = getCurrentMonth()
        }
    }
    
    @ViewBuilder
    func cardView(value: DateValue) -> some View {
        VStack {
            
            if value.day != -1 {
                Text("\(value.day)")
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    // extrating Year and Month for display...
    func extraDate() -> [String] {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        
        return date.components(separatedBy: " ")
    }
    
    func getCurrentMonth() -> Date {
        
        let calendar = Calendar.current
        
        // Getting Current Month Date
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else { return Date() }
        
        return currentMonth
    }
    
    func extractDate() -> [DateValue] {
        
        let calendar = Calendar.current
        
        // Getting Current Month Date
        let currentMonth = getCurrentMonth()
        
        var days = currentMonth.getAllDates().compactMap { date -> DateValue in
            // getting day...
            let day = calendar.component(.day, from: date)
            
            return DateValue(day: day, date: date)
        }
        
        // addingoffset days to get exact week day...
        let firstWeekDay = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekDay - 2 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        
        return days
    }
    
    func isToday(date: Date) -> Bool {
        let calenbar = Calendar.current
        
        return calenbar.isDate(currentDate, inSameDayAs: date)
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

// Extending Date to get Current Month Dates...
extension Date {
    
    func getAllDates() -> [Date] {
        
        let calendar = Calendar.current
        
        // getting start Date...
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        
        let range = calendar.range(of: .day, in: .month, for: startDate)!
        
        return range.compactMap { day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
        }
    }
}
