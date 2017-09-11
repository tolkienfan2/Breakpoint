//
//  LoginVC.swift
//  Breakpoint
//
//  Created by Minni K Ang on 2017-09-11.
//  Copyright © 2017 CreativeIce. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var email: InsetTextField!
    @IBOutlet weak var password: InsetTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        email.delegate = self
        password.delegate = self
        
    }

    @IBAction func signInBtnPressed(_ sender: Any) {
        if email.text != nil && password.text != nil {
            AuthService.instance.loginUser(withEmail: email.text!, andPassword: password.text!, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
//                    print(String(describing: loginError?.localizedDescription))
//                }
                
                AuthService.instance.registerUser(withEmail: self.email.text!, andPassword: self.password.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.email.text!, andPassword: self.password.text!, loginComplete: { (success, nil) in
                            print("Successfully registered new user")
                        })
                    } else {
                        print(String(describing: registrationError?.localizedDescription))
                    }
                })
            }
        })
        }
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LoginVC: UITextFieldDelegate { }
