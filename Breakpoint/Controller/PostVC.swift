//
//  PostVC.swift
//  Breakpoint
//
//  Created by Minni K Ang on 2017-09-11.
//  Copyright © 2017 CreativeIce. All rights reserved.
//

import UIKit
import Firebase

class PostVC: UIViewController {

    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var sendBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        sendBtn.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userEmail.text = Auth.auth().currentUser?.email
    }

    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendBtnPressed(_ sender: Any) {
        if textField.text != nil && textField.text != "Say something here..." {
            sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: textField.text, forUID: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (complete) in
                if complete {
                    self.textField.text = ""
                    self.sendBtn.isEnabled = true
                }
            })
        }
        dismiss(animated: true, completion: nil)
    }
}

extension PostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
