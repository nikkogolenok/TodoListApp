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
    
    var firstText: String
    var secondText: String
    var thirdText: String

    // MARK: - Body
    var body: some View {
        VStack(spacing: 17) {
            
            HStack(spacing: 0) {
                Button(action: {
                    self.incompleteButton.toggle()
                    completedButton = false
                    allButton = false
                }) {
                    Text(firstText)
                        .frame(alignment: .leading)
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                        .foregroundColor(.black)
                }
                .padding(.trailing, 54)
                if incompleteButton {
                    chevronImage()
                }
            }
            
            HStack(spacing: 0) {
                Button(action: {
                    self.completedButton.toggle()
                    incompleteButton = false
                    allButton = false
                }) {
                    Text(secondText)
                        .frame(alignment: .leading)
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                        .foregroundColor(.black)
                }
                .padding(.trailing, 54)
                if completedButton {
                    chevronImage()
                }
            }
            
            HStack {
                Button(action: {
                    self.allButton.toggle()
                    completedButton = false
                    incompleteButton = false
                }) {
                    Text(thirdText)
                        .frame(alignment: .leading)
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                        .foregroundColor(.black)
                }
                .padding(.trailing, 117)
                if allButton {
                    chevronImage()
                }
            }
        }
        .frame(width: 228, height: 130)
        .cornerRadius(5)
        .background(Color.white)
    }
    
    func chevronImage() -> some View {
        Image(systemName: "chevron.down")
            .resizable()
            .foregroundColor(FontStyleColors.colorGreen)
            .frame(width: 16, height: 12)
    }
}

struct AlertFilterView_Previews: PreviewProvider {
    static var previews: some View {
        AlertFilterView(firstText: "Incomplete Tasks", secondText: "Completed Tasks", thirdText: "All Tasks")
    }
}
