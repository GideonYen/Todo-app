import Foundation

struct Todo: Identifiable {
    var id = UUID() // Universally Unique IDentifier
    var title: String
    var isCompleted = false
    
}
