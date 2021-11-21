//
//  ForgotPasswordViewController.swift
//  LoginPas
//
//  Created by Чистяков Василий Александрович on 21.11.2021.
//

import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func forgotPasswordAction(_ sender: UITextField) {
        let email = emailField.text!
        if(!email.isEmpty) {
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if error == nil {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func closeAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
