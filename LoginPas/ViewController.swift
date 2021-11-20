//
//  ViewController.swift
//  LoginPas
//
//  Created by Чистяков Василий Александрович on 20.11.2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logoutAction(_ sender: Any) {
        do {
           try Auth.auth().signOut()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}

