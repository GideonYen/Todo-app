import SwiftUI

struct Todo_Detail_View: View {
    
    @Binding var todo: Todo
    
    var body: some View {
        Form {
            TextField("Edi title", text: $todo.title)
            TextField("Edit description", text: $todo.subtitle)
                .foregroundStyle(.gray)
            Toggle("Completed?", isOn: $todo.isCompleted)
            ColorPicker("🎨 Colour ", selection: $todo.color)
            
        }
        .navigationTitle("Todo details")
        
    }
}

struct Todo_Detail_View_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Todo_Detail_View(todo:
                    .constant(Todo(title: "", subtitle: "", color: .white))
            )
        }
    }
}
