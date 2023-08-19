//
//  ContentView.swift
//  Todo app
//
//  Created by Sapphire Blue on 19/8/23.
//

import SwiftUI

struct ContentView: View {
    @State private var todos = [
        Todo(title: "Play Minecraft"),
        Todo(title: "Play Brawl Stars"),
        Todo(title: "Catch up with SAP videos"),
        Todo(title: "Play Mobile Legends"),
        Todo(title: "Play Call Of Duty"),
        Todo(title: "Play Valorant"),
        Todo(title: "Play Chess")
    ]
    
    var body: some View {
        List(todos) { todo in
            Text(todo.title)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
