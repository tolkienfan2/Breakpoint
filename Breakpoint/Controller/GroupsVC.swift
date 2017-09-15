//
//  SecondViewController.swift
//  Breakpoint
//
//  Created by Minni K Ang on 2017-09-10.
//  Copyright © 2017 CreativeIce. All rights reserved.
//

import UIKit
import Firebase

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
        cell.configureCell(groupTitle: group.title, andDesc: group.description, andMembership: group.members)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let members = groups[indexPath.row].members
        
        if members.contains((Auth.auth().currentUser?.uid)!) {
            print("You are a member of this group")
            guard let groupFeedVC = storyboard?.instantiateViewController(withIdentifier: "GroupFeedVC") as? GroupFeedVC else { return }
            groupFeedVC.initData(forGroup: groups[indexPath.row])
            presentDetail(groupFeedVC)
            
        } else {
                    
            let popUp = UIAlertController(title: "Sorry!", message: "You are not a member of this group.", preferredStyle: .alert)
            let popUpAction = UIAlertAction(title: "OK", style: .cancel)
            popUp.addAction(popUpAction)
            present(popUp, animated: true, completion: nil)
        }
    }
}
