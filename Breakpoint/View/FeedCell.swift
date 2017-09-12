//
//  FeedCell.swift
//  Breakpoint
//
//  Created by Minni K Ang on 2017-09-11.
//  Copyright © 2017 CreativeIce. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var messageBody: UILabel!
    
    func configureCell(image: UIImage, email: String, message: String) {
        self.userImg.image = image
        self.userEmail.text = email
        self.messageBody.text = message
    }

}
