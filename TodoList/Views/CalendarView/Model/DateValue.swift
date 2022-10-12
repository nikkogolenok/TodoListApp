//
//  DateValue.swift
//  TodoList
//
//  Created by Никита Коголенок on 7.10.22.
//

import SwiftUI

struct DateValue: Identifiable {
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
