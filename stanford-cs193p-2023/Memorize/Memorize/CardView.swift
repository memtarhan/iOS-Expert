//
//  CardView.swift
//  Memorize
//
//  Created by Mehmet Tarhan on 10.12.2025.
//

import SwiftUI

typealias Card = MemoryGame<String>.Card

struct CardView: View {
    let card: Card

    init(_ card: Card) {
        self.card = card
    }

    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }

        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 8
        }
    }

    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    VStack {
        HStack {
            CardView(Card(isFaceUp: true, content: "🦜", id: "test"))
            CardView(Card(isFaceUp: true, content: "🦋", id: "test2"))
        }
        HStack {
            CardView(Card(isFaceUp: true, content: "🐔", id: "test"))
            CardView(Card(isFaceUp: true, content: "🐔", id: "test"))
        }
    }
    .padding()
    .foregroundStyle(Color.orange)
}
