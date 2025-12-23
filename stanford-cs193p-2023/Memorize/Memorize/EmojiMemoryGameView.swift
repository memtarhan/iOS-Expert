//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Mehmet Tarhan on 4.09.2025.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

    private let aspectRatio: CGFloat = 2 / 3
    private let spacing: CGFloat = 4

    var body: some View {
        VStack {
            cards
                .foregroundStyle(viewModel.color)

            Button("Shuffle") {
                withAnimation {
                    viewModel.shuffle()
                }
            }
        }

        .padding()
    }

    private var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio) { card in
            CardView(card)
                .padding(spacing)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 3)) {
                        viewModel.choose(card)
                    }
                }
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
