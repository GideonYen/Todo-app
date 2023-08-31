//
//  NewTodoView.swift
//  Todo app
//
//  Created by Sapphire Blue on 25/8/23.
//

import SwiftUI

struct NewTodoView: View {
    @Binding var sheetTodoView: [Todo]
    @State private var todoTitle = ""
    @State private var todoSubtitle = ""
    @State private var todoColor = Color.black
    @Environment(\.dismiss) var goAway
    @State private var showAlert = false
    
    var body: some View {
        Form {
            Section("Info") {
                TextField("Title", text: $todoTitle)
                TextField("Subtitle", text: $todoSubtitle)
                    .foregroundStyle(.gray)
                ColorPicker("🎨 Colour", selection: $todoColor)
            }
            Section("Actions") {
                Button("Save") {
                    let newTodo = Todo(title: todoTitle, subtitle: todoSubtitle, color: todoColor)
                    sheetTodoView.append(newTodo)
                    goAway()
                }
                Button("Cancel", role: .destructive) {
                    if todoTitle != "" {
                        showAlert = true
                    } else if todoSubtitle != ""{
                        showAlert = true
                    } else{
                        goAway()
                    }
                }
                .alert("Are you sure? ", isPresented: $showAlert) {
                    Button("No",role: .cancel) { }
                    Button("Yes",role: .destructive) {
                        goAway()
                    }
                }
            }
        }
    }
}


struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(sheetTodoView: .constant([]))
        
    }
    
}
