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
        Todo(title: "Play Chess", subtitle: "Might need to check your eyes after this")
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
                    VStack(alignment: .leading) {
                            Text(todo.title)
                                .padding(1)
                                .strikethrough(todo.isCompleted)
                        
                        if !todo.subtitle.isEmpty {
                            Text(todo.subtitle)
                                    .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
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

