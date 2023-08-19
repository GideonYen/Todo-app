//
//  ContentView.swift
//  Todo app
//
//  Created by Sapphire Blue on 19/8/23.
//

import SwiftUI

struct ContentView: View {
    @State private var todos = [
        Todo(title: "Play Minecraft", isCompleted: true),
        Todo(title: "Play Brawl Stars"),
        Todo(title: "Catch up with SAP videos"),
        Todo(title: "Play Mobile Legends"),
        Todo(title: "Play Call Of Duty"),
        Todo(title: "Play Valorant"),
        Todo(title: "Play Chess")
    ]
    
    var body: some View {
        NavigationStack {
            List($todos) { $todo in
                HStack {
                    Image (systemName: todo.isCompleted ? "checkmark.circle.fill"
                           : "circle")
                    .onTapGesture {
                        todo.isCompleted.toggle()
                    }
                    Text(todo.title)
                        .strikethrough(todo.isCompleted)
                        .padding(8)
                }
            }
            .navigationTitle("Todos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

