//
//  Chaining.swift
//  Applemango_App
//
//  Created by mars on 2022/08/15.
//

import Foundation

class Chain<Origin> {
    var origin: Origin
    
    init(origin: Origin) {
        self.origin = origin
    }
}

protocol Chainable {}

extension Chainable {
    var chain: Chain<Self> {
        return Chain(origin: self)
    }
}
