//
//  ContentView.swift
//  Memorize
//
//  Created by Mehmet Tarhan on 4.09.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
        }
        .foregroundStyle(Color.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false

    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(Color.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻")
                    .font(.largeTitle)

            } else {
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}

#Preview {
    ContentView()
}
