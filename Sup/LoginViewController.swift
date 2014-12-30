//
//  LoginViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/29/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var keyboardView: UIView!
    @IBOutlet weak var logInButton: UIButton!
    
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let backButton = UIBarButtonItem(title: "<", style: .Plain, target: self, action: "unwind")
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.setLeftBarButtonItem(backButton, animated: true)
        
        usernameTextField.becomeFirstResponder()
        usernameTextField.delegate = self
//        passwordTextField.delegate = UserDataTextFieldDelegate()
    }
    
    func unwind() {
        performSegueWithIdentifier("unwindToWelcome", sender: self)
    }
    
    @IBAction func unwindToLogin (sender: UIStoryboardSegue){
        println("ayy you unwinded")
    }
    
    @IBAction func loginButtonHit(sender: AnyObject) {
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {  //delegate method
        return false
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        println("string: \"\(string)\"")
        return true
    }
    
}
