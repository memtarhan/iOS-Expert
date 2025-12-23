//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Mehmet Tarhan on 10.09.2025.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🕷️", "🐥", "🐝", "🐒", "🦆", "🐞", "🦉", "🐸", "🐔", "🦋", "🦜"]
    
    var color: Color = .indigo

    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
                
            } else {
                return "⁉️"
            }
        }
    }

    @Published private var model = createMemoryGame()

    var cards: [Card] {
        model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }

    func choose(_ card: Card) {
        model.choose(card: card)
    }
}
