//
//  SecondViewController.swift
//  Breakpoint
//
//  Created by Minni K Ang on 2017-09-10.
//  Copyright © 2017 CreativeIce. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var groups = [Group]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllGroups { (returnedGroups) in
            self.groups = returnedGroups
            self.tableView.reloadData()
        }
    }
}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupCell else { return UITableViewCell() }
        let group = groups[indexPath.row]
        cell.configureCell(groupTitle: group.title, andDesc: group.description, andMembership: group.noOfMembers)
        return cell
    }
}
