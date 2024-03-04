//
//  ContentView.swift
//  Todo App
//
//  Created by Sivarajan on 04/03/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(0...3, id: \.self){
                        todo in Text("Hello")
                    }
                }
            }.navigationTitle("Todo")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button {
                            //
                        }label: {
                            Text("Add Todo")
                        }
                    }
                }
        }
        .padding()
    }
}

struct Todo: Identifiable, Equatable {
    var id = UUID()
    var task:String
    
}

#Preview {
    ContentView()
}

// Protocols in swift!

//
