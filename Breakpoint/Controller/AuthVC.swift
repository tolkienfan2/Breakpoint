//
//  AuthVC.swift
//  Breakpoint
//
//  Created by Minni K Ang on 2017-09-11.
//  Copyright © 2017 CreativeIce. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func faceBookBtnPressed(_ sender: Any) {
    }
    
    @IBAction func gPlusBtnPressed(_ sender: Any) {
    }
    
    @IBAction func eMailBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
}
