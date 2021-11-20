//
//  AuthViewController.swift
//  LoginPas
//
//  Created by Чистяков Василий Александрович on 20.11.2021.
//

import UIKit

class AuthViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func switchLogin(_ sender: Any) {
        print(nameField.text)
        
    }
    
}
