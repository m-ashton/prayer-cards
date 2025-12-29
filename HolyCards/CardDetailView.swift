import SwiftUI

// This view shows the full-screen card with flip animation
struct CardDetailView: View {
    let card: CardItem

    // @State tracks whether we're showing front or back of card
    // true = showing front, false = showing back
    @State private var isShowingFront = true

    // This tracks the rotation angle for the flip animation
    // @State makes it animatable
    @State private var cardRotation = 0.0

    var body: some View {
        ZStack {
            // Background color for the whole screen
            Color.gray.opacity(0.1)
                .ignoresSafeArea()  // Extends to screen edges

            // The card itself
            VStack {
                Spacer()

                // This ZStack shows either front or back based on rotation
                ZStack {
                    // Front of card
                    if isShowingFront {
                        CardFrontView(card: card)
                    } else {
                        // Back of card
                        CardBackView(card: card)
                    }
                }
                .frame(width: 300, height: 450)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                // rotation3DEffect creates the 3D flip effect
                // .degrees converts our rotation value to degrees
                // axis specifies which axis to rotate around (y = vertical)
                .rotation3DEffect(
                    .degrees(cardRotation),
                    axis: (x: 0, y: 1, z: 0)
                )
                // onTapGesture runs when user taps the card
                .onTapGesture {
                    flipCard()
                }

                Spacer()

                // Button to flip the card
                Button(action: flipCard) {
                    HStack {
                        Image(systemName: "arrow.triangle.2.circlepath")
                        Text(isShowingFront ? "Flip to Back" : "Flip to Front")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                .padding(.bottom, 40)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    // This function handles the flip animation
    func flipCard() {
        // withAnimation makes the state changes animated
        // .easeInOut creates smooth acceleration/deceleration
        withAnimation(.easeInOut(duration: 0.6)) {
            // Rotate 180 degrees
            cardRotation += 180
        }

        // Change which side is showing at the halfway point
        // DispatchQueue.main.asyncAfter schedules code to run later
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            isShowingFront.toggle()  // toggle() flips true/false
        }
    }
}

// Front of the card - displays the image
struct CardFrontView: View {
    let card: CardItem

    var body: some View {
        VStack {
            Spacer()

            // Large icon as placeholder image
            Image(systemName: card.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .foregroundColor(.blue)

            Spacer()

            // Card title at bottom
            Text(card.description)
                .font(.title2)
                .fontWeight(.bold)
                .padding()
        }
    }
}

// Back of the card - displays text content
struct CardBackView: View {
    let card: CardItem

    var body: some View {
        VStack(spacing: 20) {
            // Title
            Text(card.description)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 40)

            Divider()  // Horizontal line separator

            // Placeholder text content
            // In a real app, this would come from your data model
            Text("This is the back of the card.\n\nHere you would display additional information, prayers, or content related to \(card.description).")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
        // Counter-rotate the back content by 180 degrees
        // This compensates for the parent rotation so text appears normal
        .rotation3DEffect(
            .degrees(180),
            axis: (x: 0, y: 1, z: 0)
        )
    }
}

// Preview for development
#Preview {
    NavigationStack {
        CardDetailView(card: CardItem(imageName: "heart.fill", description: "Sacred Heart"))
    }
}
