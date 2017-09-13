//
//  GroupCell.swift
//  Breakpoint
//
//  Created by Minni K Ang on 2017-09-12.
//  Copyright © 2017 CreativeIce. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescLbl: UILabel!
    @IBOutlet weak var groupMembershipLbl: UILabel!
    
    func configureCell(groupTitle title: String, andDesc description: String, andMembership members: Int) {
        groupTitleLbl.text = title
        groupDescLbl.text = description
        groupMembershipLbl.text = "\(members) members here"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
