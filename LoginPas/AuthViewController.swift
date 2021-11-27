//
//  AuthViewController.swift
//  LoginPas
//
//  Created by Чистяков Василий Александрович on 20.11.2021.
//

import UIKit
import Firebase

class AuthViewController: UIViewController {
    
    var signup: Bool = true {
        willSet {
            if newValue {
                titleLabel.text = "Sign up"
                nameField.isHidden = false
                enterButton.setTitle("Log in", for: .normal)
            } else {
                titleLabel.text = "Log in"
                nameField.isHidden = true
                enterButton.setTitle("Sign", for: .normal)
            }
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        passwordField.delegate = self
        emailField.delegate = self
        
    }
    
    @IBAction func switchLogin(_ sender: UIButton) {
        signup = !signup
    }
    
    func showAllert() {
        let allert = UIAlertController(title: "Ошибка", message: "Заполните все поля", preferredStyle: .alert)
        allert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(allert, animated: true, completion: nil )
    }
}

extension AuthViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let name = nameField.text!
        let password = passwordField.text!
        let email = emailField.text!
        
        if(signup) {
            if(!name.isEmpty && !password.isEmpty && !email.isEmpty) {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if error == nil {
                        if let result = result{
                            print(result.user.uid)
                            let ref = Database.database().reference().child("users")
                            ref.child(result.user.uid).updateChildValues(["name": name, "email": email])
                            self.dismiss(animated: true, completion: nil)
                        }
                    }
                }
            } else {
                showAllert()
            }
        } else {
            if (!email.isEmpty && !password.isEmpty) {
                Auth.auth().signIn(withEmail: email, password: password) { result, error in
                    if error == nil {
                        self.dismiss(animated: true, completion: nil)
                    }
                }
            } else {
                showAllert()
            }
        }
        return true
    }
}
