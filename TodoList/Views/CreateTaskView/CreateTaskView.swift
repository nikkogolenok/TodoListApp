//
//  CreateTaskView.swift
//  TodoList
//
//  Created by Никита Коголенок on 6.10.22.
//

import SwiftUI

@MainActor class PersonAndProject: ObservableObject {
    @Published var selectedDate: Date? = nil
    @Published var showCalendar: Bool = false
    @Published var showPerson = false
    @Published var showProject = false
    @Published var allProject: [ProjectModel] = []
    @Published var selectedProject: String = ""
    @Published var selectedPeople: [PersonModel] = []
    @Published var memberPeople: [PersonModel] = []
    @Published var showAnyone: Bool = false
}

@available(iOS 16.0, *)
struct CreateTaskView: View {

    // MARK: - Variables
    @StateObject var viewRouter: ViewRouter
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var personAndProject = PersonAndProject()
    @AppStorage("projects") var protectsStore: Data = Data()
    @EnvironmentObject var projectInfo: Show
    @State var showCalendavView = false

    @State var currentDate: Date = Date()
    @State private var person: String = ""
    @State private var project: String = ""
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var anyOne: String = ""
    @State private var personField: Bool = false
    @State private var projectField: Bool = false
    @State private var showCalendar: Bool = false

    var people: [PersonModel] =
    [ PersonModel(name: "Inna", surname: "Ivanova", imageName: "1", email: "daasd@mail.ru"),
      PersonModel(name: "Helen", surname: "Ivanova", imageName: "4", email: "daasd@mail.ru"),
      PersonModel(name: "Valera", surname: "Ivanov", imageName: "3", email: "daasd@mail.ru"),
      PersonModel(name: "Alex",surname: "Ivanov", imageName: "3", email: "daasd@mail.ru"),
      PersonModel(name: "Ivan", surname: "Ivanov",imageName: "5", email: "daasd@mail.ru")

    ]

    // MARK: - Body
    var body: some View {

            ZStack {
                VStack {
                    CustomNavigationView(title: "New Task")

                    Spacer()
//                    Color.white

                    Rectangle()
                        .frame(height: 90)
                        .foregroundColor(FontStyleColors.colorBar)
                }
                .edgesIgnoringSafeArea(.bottom)

                VStack {
                    
                    ZStack {
                        
                        VStack {
                            HStack {
                                Text("For")
                                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                                HStack {
                                    if personAndProject.selectedPeople.isEmpty {
                                        TextField("Assignee", text: $person)
                                            .font(.custom(FontsStyleManager.Roboto.medium, size: 14))
                                            .padding(.leading)
                                            .onTapGesture {
                                                if !personAndProject.showPerson {
                                                    self.personAndProject.showPerson.toggle()
                                                }
                                                if personAndProject.showProject {
                                                    self.personAndProject.showProject.toggle()
                                                }
                                            }
                                    } else {
                                        ForEach(personAndProject.selectedPeople) { person in
                                            Image("\(person.imageName)")
                                                .resizable()
                                                .frame(width: 44, height: 44)
                                                .border(Color.clear, width: 1)
                                                .cornerRadius(10)
                                            Text("\(person.name)")
                                            Spacer()
                                        }
                                    }
                                }
                                .frame(width: personAndProject.selectedPeople.isEmpty ? 90 : 129, height: 48)
                                .background(FontStyleColors.colorSilver)
                                .cornerRadius(50)
                                
                                Text("In")
                                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                                HStack {
                                    if personAndProject.selectedProject.isEmpty {
                                        TextField("Project", text: $project)
                                            .font(.custom(FontsStyleManager.Roboto.medium, size: 14))
                                            .padding(.leading)
                                    } else {
                                        Text("\(personAndProject.selectedProject)")
                                    }
                                }
                                .frame(width: 90, height: 48)
                                .background(FontStyleColors.colorSilver)
                                .cornerRadius(50)
                                .onTapGesture {
                                    if !personAndProject.showProject {
                                        self.personAndProject.showProject.toggle()
                                    }
                                    if personAndProject.showPerson {
                                        self.personAndProject.showPerson.toggle()
                                    }
                                }
                            }
                            .padding(.top, 32)
                            .padding(.bottom, 24)
                            
                            if !personAndProject.showProject && !personAndProject.showPerson && !personAndProject.showAnyone {
                                
                                ZStack {
                                    TextField("Title", text: $title) {
                                        
                                    }
                                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                                    .padding(.leading, 25)
                                }
                                .frame(width: 344, height: 66)
                                .background(FontStyleColors.colorSilver)
                                .padding(.bottom, 16)
                                
                                Text("Description")
                                    .font(.custom(FontsStyleManager.Roboto.medium, size: 16))
                                    .padding(.trailing, 215)
                                    .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                    .padding(.bottom, 13)
                                
                                VStack {
                                    TextField("", text: $description) {
                                        
                                    }
                                    .padding(.leading, 20)
                                    .padding(.top, 10)
                                    .onChange(of: description) { value in
                                        if value.count > 256 {
                                            self.description = String(value.prefix(256))
                                        }
                                    }
                                    HStack {
                                        Image(systemName: "paperclip")
                                            .resizable()
                                            .frame(width: 20, height: 20)
                                            .foregroundColor(Color(red: 0.62, green: 0.62, blue: 0.62))
                                            .padding(.leading, 16)
                                        Spacer()
                                    }
                                    .frame(width: 295, height: 48)
                                    .border(FontStyleColors.colorSilver)
                                    .background(FontStyleColors.colorSilver)
                                    .padding(.top, 38)
                                    Spacer()
                                }
                                .frame(width: 295, height: 120)
                                .border(FontStyleColors.colorSilver)
                                .cornerRadius(5)
                                .padding(.bottom, 24)
                                
                                HStack {
                                    Text("Due Date")
                                        .font(.custom(FontsStyleManager.Roboto.medium, size: 16))
                                        .padding(.leading, 30)
                                    
                                    Button {
                                        self.personAndProject.showCalendar.toggle()
                                    } label: {
                                        if (personAndProject.selectedDate != nil) {
                                            Text("\(extraDate()[0])/\(extraDate()[1])/\(extraDate()[2])")
                                                .font(.custom(FontsStyleManager.Roboto.medium, size: 14))
                                                .foregroundColor(.white)
                                        } else {
                                            Text("Anytime")
                                                .font(.custom(FontsStyleManager.Roboto.medium, size: 14))
                                                .foregroundColor(.white)
                                        }
                                    }
                                    .frame(width: 90, height: 32)
                                    .background(FontStyleColors.colorAddProject)
                                    .cornerRadius(5)
                                    .padding(.leading, 10)
                                    Spacer()
                                }
                                .frame(width: 344, height: 66)
                                .background(FontStyleColors.colorSilver)
                                .padding(.bottom, 16)
                                
                                VStack {
                                    Text("Add Member")
                                        .font(.custom(FontsStyleManager.Roboto.medium, size: 16))
                                        .padding(.trailing, 190)
                                        .padding(.top, 24)
                                    
                                    HStack {
                                        if personAndProject.memberPeople.isEmpty {
                                            HStack {
                                                TextField("Anyone", text: $anyOne)
                                                    .font(.custom(FontsStyleManager.Roboto.medium, size: 14))
                                                    .padding(.leading)
                                            }
                                            .frame(width: 90, height: 48)
                                            .background(FontStyleColors.colorSilver)
                                            .cornerRadius(50)
                                            .padding(.leading, 22)
                                            
                                            Image("+")
                                                .resizable()
                                                .frame(width: 31, height: 32)
                                                .onTapGesture {
                                                    if !personAndProject.showAnyone {
                                                        self.personAndProject.showAnyone.toggle()
                                                    }
                                                }
                                        } else {
                                            HStack(spacing: 5) {
                                                ForEach(personAndProject.memberPeople) { person in
                                                    Image(person.imageName)
                                                        .resizable()
                                                        .frame(width: 44, height: 44)
                                                        .border(Color.clear, width: 1)
                                                        .cornerRadius(10)
                                                }
                                                
                                                Image("+")
                                                    .resizable()
                                                    .frame(width: 31, height: 32)
                                                    .onTapGesture {
                                                        if !personAndProject.showAnyone {
                                                            self.personAndProject.showAnyone.toggle()
                                                        }
                                                    }
                                            }
                                            .padding(.leading, 28)
                                        }
                                        Spacer()
                                    }
                                    
                                    NavigationLink {
                                        WorkListView(viewRouter: viewRouter)
                                    } label: {
                                        Text("Add Task")
                                            .foregroundColor(.white)
                                            .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                                    }
                                    .font(.custom(FontsStyleManager.Roboto.thin, size: 18))
                                    .frame(width: 293, height: 48)
                                    .background(FontStyleColors.colorRed)
                                    .cornerRadius(5)
                                    .padding(.top, 36)
                                }
                            }
                            if personAndProject.showPerson || personAndProject.showProject || personAndProject.showAnyone {
                                ZStack {
                                    Color(.gray)
                                    
                                    VStack {
                                        if personAndProject.showPerson || personAndProject.showAnyone {
                                            PersonViews(people: people)
                                                .padding(.top, 16)
                                                .environmentObject(personAndProject)
                                        }
                                        if personAndProject.showProject {
                                            let decoder = JSONDecoder()
                                            if let data = try? decoder.decode([ProjectModel].self, from: protectsStore) {
                                                ProjectViews(projects: data)
                                                    .environmentObject(personAndProject)
                                            }
                                        }
                                        Spacer()
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                }
                .frame(width: 343, height: 669)
                .cornerRadius(5)
                .background(.white)
                .background(Color(red: 0.867, green: 0.867, blue: 0.867)
                    .opacity(0.1)
                    .shadow(color: .black, radius: 9, x: 3, y: 3)
                    .blur(radius: 5, opaque: false)
                    .offset(y:40)
                )
                .offset(y: 24)
                
                
                if personAndProject.showCalendar {
                    GeometryReader { _ in
                        CalendarView()
                            .frame(width: 343, height: 397)
                            .background(.white)
                            .cornerRadius(5)
                            .environmentObject(personAndProject)
                    }
                    .offset(y: 250)
                    .padding(.leading, 20)
                    .background(
                        Color.black.opacity(0.5)
                            .onTapGesture {
                                self.personAndProject.showCalendar.toggle()
                            }
                    )
                    
                }
            }
            .navigationBarBackButtonHidden(true)
    }

    
    func extraDate() -> [String] {
        guard let selectedDate = personAndProject.selectedDate else {
            return [""]
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MM yyyy "
        
        let date = formatter.string(from: selectedDate)
        
        return date.components(separatedBy: " ")
    }
}

@available(iOS 16.0, *)
struct CreateTaskView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTaskView(viewRouter: ViewRouter())
    }
}



//                ZStack {
//                    VStack {
//
//                        HStack(spacing: 51) {
//                            RectangularAndText(text: "For", textInRectangular: "Assignee")
//                            RectangularAndText(text: "In", textInRectangular: "Project")
//                        }
//                        .padding(.top, 32)
//
//                        ZStack {
//                            Rectangle()
//                                .frame(width: 343, height: 66)
//                                .foregroundColor(FontStyleColors.colorSilver)
//                            TextField("Title", text: $title) {
//
//                            }
//                            .padding(.leading, 24)
//                            .onChange(of: title) { value in
//                                if value.count > 32 {
//                                    self.title = String(value.prefix(32))
//                                }
//                            }
////                            .padding(.trailing, 282)
//                        }
//                        .padding(.top, 24)
//
//                        VStack(alignment: .leading) {
//                            Text("Description")
//
//                            ZStack {
//                                TextField("", text: $description) {
//
//                                }
//                                .frame(width: 295, height: 72)
//                                .onChange(of: description) { value in
//                                    if value.count > 32 {
//                                        self.description = String(value.prefix(32))
//                                    }
//                                }
//
//                                ZStack {
//                                    Rectangle()
//                                        .frame(width: 295, height: 48)
//                                        .foregroundColor(FontStyleColors.colorSilver)
//                                        .border(Color(red: 0.917, green: 0.917, blue: 0.917), width: 1)
//                                        .padding(.top, 75)
//
//                                    Image(systemName: "paperclip")
//                                        .resizable()
//                                        .frame(width: 20, height: 21)
//                                        .padding(.top, 85)
//                                        .padding(.leading, 16)
//                                        .padding(.trailing, 260)
//                                }
//                            }
//                            .border(Color(red: 0.917, green: 0.917, blue: 0.917), width: 1)
//                            .cornerRadius(5)
//                        }
//                        .padding(.top, 16)
//
//                        ZStack {
//                            Rectangle()
//                                .frame(width: 343, height: 66)
//                                .foregroundColor(FontStyleColors.colorSilver)
//                            HStack {
//                                Text("Due Date")
//                                    .padding(.leading, 24)
//                                ZStack {
//                                    Rectangle()
//                                        .frame(width: 90, height: 32)
//                                        .cornerRadius(5)
//                                        .foregroundColor(.blue)
//                                    Button {
//                                        self.personAndProject.showCalendar.toggle()
//                                    } label: {
//                                        if (personAndProject.selectedDate != nil) {
//                                            Text("\(extraDate()[0])/\(extraDate()[1])/\(extraDate()[2])")
//                                                .font(.custom(FontsStyleManager.Roboto.medium, size: 14))
//                                                .foregroundColor(.white)
//                                        } else {
//                                            Text("Anytime")
//                                                .font(.custom(FontsStyleManager.Roboto.medium, size: 14))
//                                                .foregroundColor(.white)
//                                                .onTapGesture {
//                                                    self.showCalendavView.toggle()
//                                                }
//                                        }
//                                    }
//                                }
//                            }
//                            .padding(.trailing, 150)
//                        }
//                        .padding(.top, 24)
//
//
//                        VStack(alignment: .leading) {
//                            Text("Add Member")
//
//                            HStack {
//                                ZStack {
//                                    Rectangle()
//                                        .frame(width: 90, height: 48)
//                                        .cornerRadius(50)
//                                        .foregroundColor(FontStyleColors.colorSilver)
//
//                                    Text("Anyone")
//                                }
//
//                                ZStack {
//                                    Circle()
//                                        .frame(width: 31, height: 31)
//                                        .foregroundColor(FontStyleColors.colorSilver)
//
//                                    Text("+")
//                                        .foregroundColor(.white)
//                                }
//                            }
//
//                            NavigationLink("Add Task") {
//                                TaskFullView()
//                            }
//                            .frame(width: 295, height: 48)
//                            .background(FontStyleColors.colorRed)
//                            .foregroundColor(FontStyleColors.colorWhite)
//                            .cornerRadius(5)
//
//                            Spacer()
//                        }
//                        .padding(.top, 24)
//                    }
//                    .frame(width: 343, height: 669)
//                    .cornerRadius(5)
//                    .background(.white)
//                    .background(Color(red: 0.867, green: 0.867, blue: 0.867)
//                                    .opacity(0.1)
//                                    .shadow(color: .black, radius: 9, x: 3, y: 3)
//                                    .blur(radius: 5, opaque: false)
//                                    .offset(y:40)
//                    )
//                    .offset(y: 24)
//                }
//                if showCalendavView {
//                    GeometryReader { _ in
//                        CalendarView()
//                            .frame(width: 343, height: 397)
//                            .background(.white)
//                            .padding(.horizontal, 16)
//                            .offset(y: 180)
//                    }
//                    .background(
//                        Color.black.opacity(0.5)
//                            .onTapGesture {
//                                self.showCalendavView.toggle()
//                            })
//                    .cornerRadius(5)
//                }
