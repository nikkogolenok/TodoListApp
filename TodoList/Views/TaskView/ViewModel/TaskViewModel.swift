//
//  TaskViewModel.swift
//  TodoList
//
//  Created by Никита Коголенок on 29.09.22.
//

import SwiftUI

class TaskViewModel: ObservableObject {
   @Published var items: [TaskModel] = [
        TaskModel(task: "Go fishing with Stephen", time: "9:00 am", offset: 0, isCompleted: true, isSwipped: false),
        TaskModel(task: "Meet according with design team", time: "10:00 am", offset: 0, isCompleted: false, isSwipped: false)
    ]
    
    // MARK: Current Week Days
    @Published var currentWeek: [Date] = []
    
    // MARK: Current Day
    @Published var currentDay: Date = Date()
    
    // MARK: Intializing
    init() {
        fetchCurrentWeek()
    }
    
    func fetchCurrentWeek() {
        
        let today = Date()
        let calendar = Calendar.current
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: today)
        
        guard let firstWeekDay = week?.start else { return }
        
        (1...7).forEach { day in
            if let weekDay = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekDay)
            }
            
        }
    }
    
    // MARK: Extracting Date
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = format
        
        return formatter.string(from: date)
    }
    
    // MARK: Checking if curent Date is Today
    func isToday(date: Date) -> Bool {
        
        let calendar = Calendar.current
        
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
}

