//
//  ContentView.swift
//  Todo app
//
//  Created by Sapphire Blue on 19/8/23.
//

import SwiftUI

struct ContentView: View {

    @StateObject var todoManager = TodoManager()
    @State private var showNewTodoSheet = false
    @State private var showLoadSampleAlert = false
    
    var body: some View {
        NavigationStack {
            List($todoManager.todos, editActions: .all) { $todo in
                NavigationLink {
                    Todo_Detail_View(todo: $todo)
                } label: {
                    TodoRowView(todo: $todo)
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                #if DEBUG
                ToolbarItem {
                    Button {
                        showLoadSampleAlert = true
                    } label: {
                        Label("Load sample data", systemImage: "clipboard")
                    }
                }
                
                #endif
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showNewTodoSheet = true
                    } label: {
                        Label("Add todo", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showNewTodoSheet) {
                NewTodoView(sheetTodoView: $todoManager.todos)
                    .presentationDetents([.medium, .large])
            }
            .alert("Load saple data? Warning: This cannot be undone!", isPresented: $showLoadSampleAlert) {
                Button("Replace", role: .destructive) {
                    todoManager.loadSampleTodos()
                }
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
