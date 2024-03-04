//
//  AddTodoView.swift
//  Todo App
//
//  Created by Sivarajan on 04/03/24.
//

import SwiftUI

struct AddTodoView: View {
    
    @State private var task = ""
    
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
                    //
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
    AddTodoView()
}
