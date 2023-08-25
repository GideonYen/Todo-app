//
//  ContentView.swift
//  Todo app
//
//  Created by Sapphire Blue on 19/8/23.
//

import SwiftUI

struct ContentView: View {
    @State var todos = [
        Todo(title: "Play Minecraft", color: .black),
        Todo(title: "Play Brawl Stars", color: .black),
        Todo(title: "Catch up with SAP videos", color: .black),
        Todo(title: "Play Mobile Legends", color: .black),
        Todo(title: "Play Call Of Duty", color: .black),
        Todo(title: "Play Valorant", color: .black),
        Todo(title: "Play Chess", subtitle: "", color: .black)
    ]
    @State private var showNewTodoSheet = false
    
    var body: some View {
        NavigationStack {
            List($todos, editActions: .all) { $todo in
                NavigationLink {
                    Todo_Detail_View(todo: $todo)
                } label: {
                    HStack {
                        Image (systemName: todo.isCompleted ? "checkmark.circle.fill"
                               : "circle")
                        .onTapGesture {
                            todo.isCompleted.toggle()
                        }
                        VStack(alignment: .leading) {
                            Text(todo.title)
                                .foregroundStyle(todo.color)
                                .padding(1)
                                .strikethrough(todo.isCompleted)
                            
                            if !todo.subtitle.isEmpty {
                                Text(todo.subtitle)
                                    .font(.footnote)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewTodoSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showNewTodoSheet) {
                NewTodoView(sheetTodoView: $todos)
                    .presentationDetents([.medium, .large])
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
