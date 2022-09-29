//
//  TasksView.swift
//  TodoList
//
//  Created by Никита Коголенок on 29.09.22.
//

import SwiftUI

struct TasksView: View {
    
    // MARK: - Variables
    @Binding var task: TaskModel
    @Binding var tasks: [TaskModel]
    
    // MARK: - Body
    var body: some View {

        VStack {
            ZStack() {
                Color.white
                HStack {
                    Spacer()
                    Button {
                    } label: {
                        Image(systemName: "pencil")
                            .foregroundColor(Color.red)
                            .font(.system(size: 25, weight: .heavy))
                            .frame(width: 50, height: 30)
                    }

                    Button  {
                        withAnimation(.easeIn) {
                            deleteTask()
                        }
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(Color.red)
                            .font(.system(size: 25, weight: .heavy))
                            .frame(width: 50, height: 30)
                    }
                }
                .padding(.horizontal)
                
                HStack {
                    Button {
                        if task.isCompleted == true {
                            task.isCompleted = false
                        } else {
                            task.isCompleted = true
                        }
                    } label: {
                        Image( systemName: task.isCompleted ? "checkmark.circle" : "circle")
                            .padding(.horizontal)
                            .font(.bold(.system(size: 20))())
                            .foregroundColor(task.isCompleted ? Color.red : Color.blue)
                    }


                    VStack(alignment: .leading, spacing: 7) {

                        Text(task.task)
                            .strikethrough(task.isCompleted)
                            .font(.custom("Roboto-Medium", size: 16))
                            .foregroundColor(task.isCompleted ? Color.gray : Color.black)
                        Text(task.time)
                            .font(.custom("Roboto-Medium", size: 16))
                            .foregroundColor(Color.gray)
                            .strikethrough(task.isCompleted)

                    }
                    Spacer()
                    Color(task.isCompleted ? "colorRed" : "barColor")
                        .frame(width: 4, height: 21)

                }
                .padding(.vertical)
                .background(.white)
                .frame(maxWidth: .infinity)
                .contentShape(Rectangle())
                .cornerRadius(5)
                .shadow(color: .gray.opacity(0.1), radius: 2, x: 0, y: 9)
                .padding()
                .offset(x: task.offset)
                .gesture(DragGesture().onChanged(onChanged(value:)).onEnded(onEnd(value:)))
            }
        }
        .navigationBarHidden(true)
    }
    
    // MARK: - Methods
    func onChanged(value: DragGesture.Value) {

        if value.translation.width < 0 {
            if task.isSwipped {
                task.offset = value.translation.width - 110
            }
            else {
                task.offset = value.translation.width
            }
        }
    }
    
    func onEnd(value: DragGesture.Value) {
        withAnimation(.easeOut) {
            if value.translation.width < 0 {

                if -value.translation.width > UIScreen.main.bounds.width / 2 {
                    task.offset = -1000
                    deleteTask()
                }
                else if -task.offset > 50 {
                    task.isSwipped = true
                    task.offset = -110
                }
                else {
                    task.isSwipped = false
                    task.offset = 0
                }
            }
            else {
                task.isSwipped = false
                task.offset = 0
            }
        }
    }

    func deleteTask() {
        tasks.removeAll { (task) -> Bool in
            return self.task.id == task.id
        }
    }
    
}
