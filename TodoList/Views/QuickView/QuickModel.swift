//
//  QuickModel.swift
//  TodoList
//
//  Created by Никита Коголенок on 21.10.22.
//

import SwiftUI

struct QuickModel: Identifiable, Codable {
    var id = UUID().uuidString
    var task: String
    var color: TapToColors = .red
}
