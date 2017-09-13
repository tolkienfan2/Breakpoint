//
//  UserCell.swift
//  Breakpoint
//
//  Created by Minni K Ang on 2017-09-12.
//  Copyright © 2017 CreativeIce. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var checkMark: UIImageView!
    
    var showing = false
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool) {
        self.profileImage.image = image
        self.label.text = email
        if isSelected {
            self.checkMark.isHidden = false
        } else {
            self.checkMark.isHidden = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            if showing == false {
                checkMark.isHidden = false
                showing = true
            } else {
                checkMark.isHidden = true
                showing = false
            }
        }
    }
}
