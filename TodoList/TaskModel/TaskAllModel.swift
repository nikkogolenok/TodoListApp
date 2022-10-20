//
//  TaskAllModel.swift
//  TodoList
//
//  Created by Никита Коголенок on 13.10.22.
//

import Foundation
import SwiftUI

struct TaskAllModel: Identifiable, Equatable {
    var id: String = UUID().uuidString
    let task: String
    let time: String
    let offset: CGFloat
    let isCompleted: Bool
    let isSwipped: Bool
    let date: Date
}

enum Priority: Int, Identifiable, CaseIterable {
    var id: Int { rawValue }
    
    case bluePriority
    case redPriority
    case greenPriority
    case violetPriority
    
    var title: String {
        
        switch self {
        case .bluePriority:
            return "Blue Priority"
        case .redPriority:
            return "Red Priority"
        case .greenPriority:
            return "Green Priority"
        case .violetPriority:
            return "Violet Priority"
        }
    }
    
    var image: Image {
        switch self {
        case .bluePriority:   return Image("circleBlue")
        case .redPriority:    return Image("circlered")
        case .greenPriority:  return Image("circleBlue")
        case .violetPriority: return Image("circleViolet")
        }
    }
}

enum SortType: String, Identifiable, CaseIterable {
    
    var id: String { rawValue }
    case alphabetical
    case date
    case priority
}
