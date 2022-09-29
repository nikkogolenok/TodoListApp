//
//  AlertFilterView.swift
//  TodoList
//
//  Created by Никита Коголенок on 29.09.22.
//

import SwiftUI

struct AlertFilterView: View {
    
    //MARK: - Variables
    @State var incompleteButton: Bool = false
    @State var completedButton: Bool = false
    @State var allButton: Bool = false

    // MARK: - Body
    var body: some View {
        VStack(spacing: 17) {
            
            HStack(spacing: 0) {
                Button(action: {
                    self.incompleteButton.toggle()
                    completedButton = false
                    allButton = false
                }) {
                    Text("Incomplete Tasks")
                        .frame(alignment: .leading)
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                        .foregroundColor(.black)
                }
                .padding(.trailing, 54)
                if incompleteButton {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .foregroundColor(FontStyleColors.colorGreen)
                        .frame(width: 16, height: 12)
                }
            }
            
            HStack(spacing: 0) {
                Button(action: {
                    self.completedButton.toggle()
                    incompleteButton = false
                    allButton = false
                }) {
                    Text("Completed Tasks")
                        .frame(alignment: .leading)
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                        .foregroundColor(.black)
                }
                .padding(.trailing, 54)
                if completedButton {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .foregroundColor(FontStyleColors.colorGreen)
                        .frame(width: 16, height: 12)
                }
            }
            
            HStack {
                Button(action: {
                    self.allButton.toggle()
                    completedButton = false
                    incompleteButton = false
                }) {
                    Text("All Tasks")
                        .frame(alignment: .leading)
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                        .foregroundColor(.black)
                }
                .padding(.trailing, 117)
                if allButton {
                    Image(systemName: "chevron.down")
                        .resizable()
                        .foregroundColor(FontStyleColors.colorGreen)
                        .frame(width: 16, height: 12)
                }
            }
        }
        .frame(width: 228, height: 130)
        .cornerRadius(5)
        .background(Color.white)
    }
}

struct AlertFilterView_Previews: PreviewProvider {
    static var previews: some View {
        AlertFilterView()
    }
}
