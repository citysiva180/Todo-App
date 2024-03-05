//
//  ContentView.swift
//  Todo App
//
//  Created by Sivarajan on 04/03/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var todoList:TodoList = TodoList()
    
    
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(todoList.todos){
                        todo in HStack{
                            Text(todo.task)
                            Spacer()
                        }
                    }
                }
            }.navigationTitle("Todo")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
                            todoList.showAddTodoView.toggle()
                        }label: {
                            Text("Add Todo")
                        }
                    }
                }
                .sheet(isPresented: $todoList.showAddTodoView){
                    AddTodoView(todoList: todoList)
                }
        }
        .padding()
    }
}

// Very very important concepts
// Identifiable defines that individual elements within this app will be id'ed.
// This is similar to maping id to elements like in react

struct Todo: Identifiable, Equatable {
    var id = UUID()
    var task:String
    
}

// ObservableObject is similar to Redux state in React. The Observable Object keeps a track of changes within state and changes it according
class TodoList: ObservableObject{
    @Published var todos: [Todo] = []
    @Published var showAddTodoView = false // Remember, only published variables are observable. Published var is mostly used as data source
    
    // Function to add Todo Values
    func addTodo(task:String){
        todos.append(Todo(task:task))
    }
    // Function to delete Todo Values
    func deleteTodo(todo:Todo){
        if let index = todos.firstIndex(of: todo){
            todos.remove(at: index)
        }
    }
    
    
}

#Preview {
    ContentView()
}

// Protocols in swift!

// protocols defines a blueprint of methods,
// properties and other requirements that suit a
// certain tasks or piece of functionality

//var persons: [Person] = []
//
//struct Person {
//    var name: String
//    var age : Int 
//}
