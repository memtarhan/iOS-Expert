//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Mehmet Tarhan on 4.09.2025.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
