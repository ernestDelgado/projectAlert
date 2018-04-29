//
//  RoundedClasses.swift
//  Alert
//
//  Created by Irena Guerrero on 4/28/18.
//  Copyright © 2018 Irena Guerrero. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10.0
    }
}

class RoundedView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 85
    }
}
