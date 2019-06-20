//
//  Descriptionable.swift
//  Matrix
//
//  Created by user149331 on 6/11/19.
//  Copyright © 2019 Ostap. All rights reserved.
//

public protocol Descriptionable {
    init?(_ string: String)

    var description: String { get }
}
