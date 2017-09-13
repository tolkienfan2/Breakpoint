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
    
    var members: [String]!
    
    func configureCell(groupTitle title: String, andDesc description: String, andMembership members: [String]) {
        groupTitleLbl.text = title
        groupDescLbl.text = description
        groupMembershipLbl.text = "\(members.count) members here"
        self.members = members
    }
}
