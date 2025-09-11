//
//  MemoryGame.swift
//  Memorize
//
//  Created by Mehmet Tarhan on 10.09.2025.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: [Card]

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0 ..< max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }

    func choose(card: Card) {
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }

    struct Card {
        var isFaceUp = true 
        var isMatched = false
        let content: CardContent
    }
}
