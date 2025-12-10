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
    }

    var body: some View {
        ZStack { let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)

            Group {
                base
                    .foregroundStyle(Color.white)
                base
                    .strokeBorder(lineWidth: Constants.lineWidth)
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.inset)
            }
            .opacity(card.isFaceUp ? 1 : 0)

            base
                .fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    VStack {
        HStack {
            CardView(Card(isFaceUp: true, content: "X", id: "test"))
            CardView(Card(content: "Y", id: "test2"))
        }
        HStack {
            CardView(Card(isFaceUp: true, isMatched: true, content: "X", id: "test"))
            CardView(Card(isMatched: true, content: "X", id: "test"))
        }
    }
    .padding()
    .foregroundStyle(Color.green)
}
