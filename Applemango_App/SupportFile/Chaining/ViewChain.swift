//
//  ViewChain.swift
//  Applemango_App
//
//  Created by mars on 2022/08/15.
//

import UIKit

extension UIView: Chainable {}

extension Chain where Origin == UITableView {
    func add(to parent: UIView) -> Chain {
        parent.addSubview(origin)
        return self
    }
}

extension Chain where Origin == UIView {
    func add(to parent: UIView) -> Chain {
        parent.addSubview(origin)
        return self
    }
}
