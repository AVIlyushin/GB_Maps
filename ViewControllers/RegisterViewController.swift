//
//  RegisterViewController.swift
//  frameworks
//
//  Created by iMac on 13.11.2021.
//  Copyright © 2021 AVIlyushin. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func saveButtonWasTapped(_ sender: UIButton) {
        let user = User()
        user.login = loginTextField.text
        user.password = passwordTextField.text
        RealmService.saveDataToRealm(user)
    }

}
