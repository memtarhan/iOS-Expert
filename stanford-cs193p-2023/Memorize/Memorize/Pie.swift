//
//  Pie.swift
//  Memorize
//
//  Created by Mehmet Tarhan on 11.12.2025.
//

import CoreGraphics
import SwiftUI

struct Pie: Shape {
    var startAngle: Angle = .zero
    let endAngle: Angle
    var clockwise = true

    func path(in rect: CGRect) -> Path {
        let startAngle = startAngle - .degrees(90)
        let endAngle = endAngle - .degrees(90)
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2

        let start = CGPoint(
            x: center.x + radius / 2 * cos(Double(startAngle.radians)),
            y: center.y + radius / 2 * sin(startAngle.radians)
        )

        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center,
                 radius: radius,
                 startAngle: startAngle,
                 endAngle: endAngle,
                 clockwise: !clockwise)
        p.addLine(to: center)

        return p
    }
}
