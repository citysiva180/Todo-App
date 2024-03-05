//
//  AddTodoView.swift
//  Todo App
//
//  Created by Sivarajan on 04/03/24.
//

import SwiftUI

struct AddTodoView: View {
    
    @State private var task = "" // State is within this component Wherease observable object is for other objects
    @ObservedObject var todoList:TodoList // Remember how we declared the observable Object. Now the changes in the observable object become observed object in this view. Hence this variable will take care of it!
    
    
    var body: some View {
        NavigationView{
            VStack{
                RoundedRectangle(cornerRadius: 15)
                    .frame(width:300, height: 50)
                    .shadow(color: .gray, radius: 2,x: 0, y: 2)
                    .foregroundColor(.white)
                    .overlay(
                       TextField("What would you like to add?", text: $task)
                        .multilineTextAlignment(.center)
                    )
                Button{
                    todoList.addTodo(task: task)
                    todoList.showAddTodoView = false 
                
                } label: {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .frame(width: 300, height:50)
                        .foregroundColor(.blue)
                        .overlay(Text("Add to do")
                            .foregroundColor(.white)
                            .bold()
                        )
                }
                .padding()
                Spacer()
            }
            .padding(.top, 35)
            .navigationTitle("Add a Note 📝")
        }
    }
}

#Preview {
    AddTodoView(todoList: TodoList()) // The todo list depends on parameters outside its component. Now that we have declared the observed Object in the view its time we add its parameter in this view so the same could be displayed.
}
