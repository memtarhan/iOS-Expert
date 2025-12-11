//
//  Cardify.swift
//  Memorize
//
//  Created by Mehmet Tarhan on 11.12.2025.
//

import SwiftUI

struct Cardify: ViewModifier {
    let isFaceUp: Bool

    func body(content: Content) -> some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)

            Group {
                base
                    .foregroundStyle(Color.white)
                base
                    .strokeBorder(lineWidth: Constants.lineWidth)
                content
            }
            .opacity(isFaceUp ? 1 : 0)

            base
                .fill()
                .opacity(isFaceUp ? 0 : 1)
        }
    }

    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}
