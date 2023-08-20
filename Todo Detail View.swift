import SwiftUI

struct Todo_Detail_View: View {
    
    @Binding var todo: Todo
    
    var body: some View {
        Form {
            TextField("Enter your todo name", text: $todo.title)
            TextField("Enter additional details", text: $todo.subtitle)
                .foregroundStyle(.gray)
            Toggle("Completed?", isOn: $todo.isCompleted)
        }
        .navigationTitle("Todo details")
    }
}

struct Todo_Detail_View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Todo_Detail_View(todo:
                    .constant(Todo(title: "", subtitle: ""))
            )
        }
    }
}
