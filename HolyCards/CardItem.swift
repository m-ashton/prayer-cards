import SwiftUI

// This is your data model for each list item
// 'struct' defines a structure - a custom data type
// 'Identifiable' protocol allows SwiftUI to uniquely identify each item in a list
struct CardItem: Identifiable {
    // 'let' declares a constant (can't be changed after initialization)
    // 'var' declares a variable (can be changed)
    let id: UUID  // Unique identifier for each card
    let imageName: String  // Name of the image to display
    let description: String  // Text description

    // This is an initializer (constructor in other languages)
    // It creates a new CardItem with default values
    init(imageName: String, description: String) {
        self.id = UUID()  // UUID() generates a unique identifier
        self.imageName = imageName
        self.description = description
    }
}
