//
//  RoundedButton.swift
//  Breakpoint
//
//  Created by Minni K Ang on 2017-09-11.
//  Copyright © 2017 CreativeIce. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = 10
        super.awakeFromNib()
    }

}
