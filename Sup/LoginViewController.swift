//
//  LoginViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/29/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: WTReTextField!
    @IBOutlet weak var passwordTextField: WTReTextField!
    @IBOutlet weak var keyboardView: UIView!
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let backButton = UIBarButtonItem(title: "<", style: .Plain, target: self, action: "unwind")
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.setLeftBarButtonItem(backButton, animated: true)
        
        usernameTextField.becomeFirstResponder()
        usernameTextField.pattern = "^(\\S|[a-z]|[A-Z]|[0-9])*$"
    }
    
    func unwind() {
        performSegueWithIdentifier("unwindToWelcome", sender: self)
    }
    
    @IBAction func unwindToLogin (sender: UIStoryboardSegue){
        println("ayy you unwinded")
    }
    
    
}
