//
//  QuickView.swift
//  TodoList
//
//  Created by Никита Коголенок on 20.09.22.
//

import SwiftUI

struct QuickView: View {
    
    // MARK: - Variable
    @StateObject var viewModel = QuickViewModel()
    
    // MARK: - Boby
    var body: some View {
        //        Text("Quick")
        //
        //            .offset(y: 20)
        //            .navigationBarBackButtonHidden(true)
        //            .navigationTitle("Quick Notes")
        //            .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
        //            .foregroundColor(.white)
        
        
        VStack(spacing: 32) {
            ZStack {
                VStack {
                    Text("Quick Notes")
                        .foregroundColor(Color(red: 0.192, green: 0.192, blue: 0.192))
                        .padding(.top, 48)
                    
                }
            }
            .frame(width: 375, height: 100)
//            .background(.blue)
            .navigationBarHidden(true)
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.items) { item in
                        QuicksView(quick: $viewModel.items[getIndex(tasks: item)], quicks: $viewModel.items)
                    }
                }
                .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 9)
            }
            .navigationBarHidden(true)
        }
    }
    
    func getIndex(tasks: QuickModel) -> Int {
        return viewModel.items.firstIndex { (task1) -> Bool in
            return tasks.id == task1.id
        } ?? 0
    }
}

struct QuickView_Previews: PreviewProvider {
    static var previews: some View {
        QuickView()
    }
}

