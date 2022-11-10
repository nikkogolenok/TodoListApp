//
//  QuicksView.swift
//  TodoList
//
//  Created by Никита Коголенок on 21.10.22.
//

import SwiftUI

struct QuicksView: View {
    
    // MARK: - Variable
    @Binding var quick: QuickModel
    @Binding var quicks: [QuickModel]
    
    // MARK: - Boby
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 343, height: 94)
                .foregroundColor(.yellow)
            
            Rectangle()
                .frame(width: 121, height: 3)
                .padding(.leading, 32)
                .padding(.trailing, 191)
                .padding(.bottom, 91)
                .foregroundColor(Color(quick.color.rawValue))
            
            Text(quick.task)
        }
        .cornerRadius(9)
    }
}

//struct QuicksView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuicksView(quick: QuickModel(task: "Meeting with Jessica in Central Park", color: .red))
//    }
//}
