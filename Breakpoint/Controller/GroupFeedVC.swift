//
//  GroupFeedVC.swift
//  Breakpoint
//
//  Created by Minni K Ang on 2017-09-13.
//  Copyright © 2017 CreativeIce. All rights reserved.
//

import UIKit
import Firebase

class GroupFeedVC: UIViewController {

    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var messages = [Message]()
    var group: Group!
    var groupKey: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTitleLbl.text = group.title
        groupKey = group.key
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataService.instance.getAllFeedMessages { (returnedMessages) in
            let returnedMessages = returnedMessages.reversed()
            for message in returnedMessages {
                if message.groupKey != nil {
                   if message.groupKey == self.group.key {
                        self.messages.append(message)
                    }
                }
            }
            if self.messages.count > 0 {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func newMessageBtnPressed(_ sender: Any) {
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension GroupFeedVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupFeedCell") as? GroupFeedCell else { return UITableViewCell() }
        let image = UIImage(named: "defaultProfileImage")
        let content = messages[indexPath.row].message
        let senderId = messages[indexPath.row].senderId
        DataService.instance.getUsername(forUID: senderId) { (returnedUsername) in
        cell.configureCell(profileImage: image!, emailLbl: returnedUsername, contentLbl: content)
        }
        return cell
    }
}
