//
//  GroupFeedCell.swift
//  Breakpoint
//
//  Created by Minni K Ang on 2017-09-13.
//  Copyright © 2017 CreativeIce. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
  
    func configureCell(profileImage image: UIImage, emailLbl email: String, contentLbl content: String) {
        self.profileImage.image = image
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
    
}
