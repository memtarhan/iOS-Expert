//
//  NSLayoutConstraint.swift
//  CoolSymbols
//
//  Created by Mehmet Tarhan on 5.12.2025.
//

import UIKit

extension NSLayoutConstraint {
    @discardableResult func activate() -> NSLayoutConstraint {
        isActive = true
        return self
    }
}
