//
//  SnapKitChain.swift
//  Applemango_App
//
//  Created by mars on 2022/08/15.
//

import UIKit
import SnapKit

extension Chain where Origin: UIView {
    func makeConstraint(_ maker: (ConstraintMaker) -> Void) -> Chain {
        origin.snp.makeConstraints(maker)
        return self
    }
    
    func updateConstraint(_ maker: (ConstraintMaker) -> Void) -> Chain {
        origin.snp.updateConstraints(maker)
        return self
    }
}




