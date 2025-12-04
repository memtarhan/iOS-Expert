//
//  MemoryGame.swift
//  Memorize
//
//  Created by Mehmet Tarhan on 10.09.2025.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0 ..< max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex + 1)a"))
            cards.append(Card(content: content, id: "\(pairIndex + 1)b"))
        }
    }

    mutating func choose(card: Card) {
        print("chose: \(card)")
        if let chosenIndex = index(of: card) {
            cards[chosenIndex].isFaceUp.toggle()
        }
    }

    private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }

        return nil
    }

    mutating func shuffle() {
        cards.shuffle()
    }

    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent

        var id: String

        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "matched" : ""))"
        }
    }
}
