//
//  AddTodoView.swift
//  Todo App
//
//  Created by Sivarajan on 04/03/24.
//

import SwiftUI

struct AddTodoView: View {
    //Code completed!
    @State private var task = "" // State is within this component Wherease observable object is for other objects
    @ObservedObject var todoList:TodoList // Remember how we declared the observable Object. Now the changes in the observable object become observed object in this view. Hence this variable will take care of it!
    @State private var displayText = "What would you like to add?"
    
    
    var body: some View {
        NavigationView{
            VStack{
                RoundedRectangle(cornerRadius: 15)
                    .frame(width:300, height: 50)
                    .shadow(color: .gray, radius: 2,x: 0, y: 2)
                    .foregroundColor(.white)
                    .overlay(
                       TextField(displayText, text: $task)
                        .multilineTextAlignment(.center)
                    )
                // This particular button has all the important elements. to begin with, you will need the add todo button embedded with the addTodo function from the todo list class. Note that the class is comming from the observed Object
                Button{
                    if task != ""{
                        todoList.addTodo(task: task) // This is the observed Object action
                        todoList.showAddTodoView = false // This toggle button ensures that this view has to be shown or not. This is a class attribute from the todo function
                    } else {
                        displayText = "Enter some Text First!"
                    }
                    
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
