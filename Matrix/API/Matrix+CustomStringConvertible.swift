//
//  Matrix+CustomStringConvertible.swift
//  Matrix
//
//  Created by Ostap Tyvonovych on 13.08.2022.
//  Copyright © 2022 OstapTyvonovych. All rights reserved.
//

import Foundation

extension Matrix: CustomStringConvertible where Element: CustomStringConvertible {
    /// A textual representation of this matrix.
    public var description: String {
        let stringDescriptionService = StringDescriptionService<Element>()
        return stringDescriptionService.makeDescription(using: storage, for: size)
    }
}
