//
//  NSCoder.swift
//  CoolSymbols
//
//  Created by Mehmet Tarhan on 5.12.2025.
//

import Foundation

extension NSCoder {
    static func fatalErrorNotImplemented() -> Never {
        fatalError("init(coder:) has not been implemented")
    }
}
