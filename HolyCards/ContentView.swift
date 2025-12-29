import SwiftUI

// This is your main view - what users see when they open the app
struct ContentView: View {
    // @State is a property wrapper that tells SwiftUI to watch this variable
    // When it changes, SwiftUI automatically updates the view
    @State private var cards: [CardItem] = []

    // Every View must have a 'body' property that returns some View
    var body: some View {
        // NavigationStack provides the navigation container
        NavigationStack {
            // List creates a scrollable list of items
            // The 'cards' array is what we iterate over
            // Each 'card' in the array gets passed to the closure
            List(cards) { card in
                // NavigationLink makes the row tappable and navigates to the destination
                // 'destination' is the view to show when tapped
                // The CardRow is what's displayed in the list
                NavigationLink(destination: CardDetailView(card: card)) {
                    CardRow(card: card)
                }
            }
        }
        // .onAppear runs when the view first appears
        .onAppear {
            loadSampleData()
        }
    }

    // This function loads sample data into the cards array
    // In Swift, functions are defined with 'func'
    func loadSampleData() {
        cards = [
            CardItem(imageName: "cross.fill", description: "Sacred Cross"),
            CardItem(imageName: "bird.fill", description: "Holy Spirit"),
            CardItem(imageName: "heart.fill", description: "Sacred Heart"),
            CardItem(imageName: "star.fill", description: "Star of Bethlehem"),
            CardItem(imageName: "book.fill", description: "Holy Scripture"),
            CardItem(imageName: "flame.fill", description: "Divine Light"),
            CardItem(imageName: "circle.grid.cross.fill", description: "Holy Rosary"),
            CardItem(imageName: "cup.and.saucer.fill", description: "Holy Communion")
        ]
    }
}

// This is a custom view for each row in the list
// It takes a CardItem and displays it with an image and text
struct CardRow: View {
    let card: CardItem

    var body: some View {
        // HStack arranges views horizontally (H = Horizontal)
        HStack(spacing: 12) {
            // Image view - using SF Symbols (built-in iOS icons)
            // We use systemName because we're using SF Symbols
            Image(systemName: card.imageName)
                .resizable()  // Makes image resizable
                .aspectRatio(contentMode: .fit)  // Maintains aspect ratio
                .frame(width: 50, height: 50)  // Sets size
                .foregroundColor(.blue)  // Sets color
                .padding(8)  // Adds padding around the image
                .background(Color.blue.opacity(0.1))  // Light blue background
                .cornerRadius(8)  // Rounds the corners

            // Text view for the description
            Text(card.description)
                .font(.headline)  // Sets font style
                .foregroundColor(.primary)  // Primary color adapts to light/dark mode

            Spacer()  // Pushes content to the left
        }
        .padding(.vertical, 4)  // Adds vertical padding to each row
    }
}

// This creates a preview that shows up in Xcode's canvas
// It's only for development and doesn't appear in the actual app
#Preview {
    ContentView()
}
