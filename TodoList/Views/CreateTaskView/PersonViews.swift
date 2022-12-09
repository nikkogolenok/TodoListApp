//
//  PersonViews.swift
//  TodoList
//
//  Created by Никита Коголенок on 7.12.22.
//

import SwiftUI

struct PersonViews: View {
    
    @State var people: [PersonModel]
    @EnvironmentObject var selectedPerson: PersonAndProject
    
    var body: some View {
        
        ForEach(people) { person in
            
            HStack(spacing: 0) {
                
                Image("\(person.imageName)")
                    .resizable()
                    .frame(width: 44 ,height: 44)
                    .padding(.leading, 16)
                    .cornerRadius(15)
                    
                VStack{
                    
                    Text("\(person.name) \(person.surname)")
                        .font(.custom(FontsStyleManager.Roboto.thin, size: 16))
                        .padding(.leading, 10)
                    
                    Text("\(person.email)")
                        .font(.custom(FontsStyleManager.Roboto.medium, size: 14))
                        .padding(.leading, 10)
                }
                
                Spacer()
            }
            .onTapGesture {
                
                if selectedPerson.showAnyone {
                    selectedPerson.memberPeople.append(person)
                    selectedPerson.showAnyone.toggle()
                } else {
                    selectedPerson.selectedPeople.append(person)
                    selectedPerson.showPerson.toggle()
                }
                
            }
        }
    }
}
