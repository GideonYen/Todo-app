import Foundation
import SwiftUI

struct Todo: Identifiable, Codable {
    var id = UUID() // Universally Unique IDentifier
    var title: String
    var subtitle = ""
    var isCompleted = false
    var color: Color
    }
