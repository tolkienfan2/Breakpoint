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
    @IBOutlet weak var postView: UIView!
    @IBOutlet weak var postTextField: InsetTextField!
    @IBOutlet weak var postBtn: UIButton!
    
    var groupMessages = [Message]()
    var group: Group?
    var membersList = ""

    func initData(forGroup group: Group) {
        self.group = group
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postTextField.delegate = self
        postView.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        groupTitleLbl.text = group!.title
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllMessagesFor(desiredGroup: self.group!, handler: { (returnedGroupMessages) in
                self.groupMessages = returnedGroupMessages.reversed()
                self.tableView.reloadData()
            })
        }
    }
    
    @IBAction func titleBtnPressed(_ sender: Any) {
        DataService.instance.getEmailsFor(group: group!) { (returnedEmails) in
            self.membersList = returnedEmails.joined(separator: ", ")
        }

        let popUp = UIAlertController(title: "Our members", message: self.membersList, preferredStyle: .alert)
        let popUpAction = UIAlertAction(title: "OK", style: .cancel)
        popUp.addAction(popUpAction)
        present(popUp, animated: true, completion: nil)
    }
    
    @IBAction func postBtnPressed(_ sender: Any) {
        if postTextField.text != "" {
            postTextField.isEnabled = false
            postBtn.isEnabled = false
 
            DataService.instance.uploadPost(withMessage: postTextField.text!, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: self.group?.key, sendComplete: { (complete) in
                    if complete {
                        self.postTextField.text = ""
                        self.postBtn.isEnabled = true
                        self.postTextField.isEnabled = true
                        self.postTextField.placeholder = "Start typing..."
                }
            })
        }
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
        return groupMessages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupFeedCell") as? GroupFeedCell else { return UITableViewCell() }
        let image = UIImage(named: "defaultProfileImage")
        let content = groupMessages[indexPath.row].message
        let senderId = groupMessages[indexPath.row].senderId
        DataService.instance.getUsername(forUID: senderId) { (returnedUsername) in
        cell.configureCell(profileImage: image!, emailLbl: returnedUsername, contentLbl: content)
        }
        return cell
    }
}

extension GroupFeedVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = ""
    }
}
