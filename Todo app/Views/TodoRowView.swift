//
//  TodoRowView.swift
//  Todo app
//
//  Created by Sapphire Blue on 25/8/23.
//

import SwiftUI

struct TodoRowView: View {
    @Binding var todo: Todo
    var body: some View {
        HStack {
            Image(systemName: todo.isCompleted ? "checkmark.circle.fill"
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

struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        TodoRowView(todo: .constant(Todo(title: "Fake title",color: .white)))
    }
}
