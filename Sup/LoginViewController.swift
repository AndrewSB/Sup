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
    @IBOutlet weak var logInButton: UIButton!
    
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let backButton = UIBarButtonItem(image: UIImage(named: "back"), style: .Plain, target: self, action: "unwind")
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.setLeftBarButtonItem(backButton, animated: true)
        
        usernameTextField.becomeFirstResponder()
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        println(self.navigationItem)
    }
    
    func unwind() {
        performSegueWithIdentifier("unwindToWelcome", sender: self)
    }
    
    // MARK: UITextFieldDelegateMethods
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField!) -> Bool {
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        println("string: \"\(string)\"")
        return true
    }
    
    @IBAction func unwindToLogin (sender: UIStoryboardSegue){
        println("ayy you unwinded")
    }
    
    @IBAction func loginButtonHit(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameTextField.text, password: passwordTextField.text, block: {(succeeded, error) in
            if error == nil {
                println("segue to main")
                self.navigationController?.popToRootViewControllerAnimated(false)
            } else {
                println(error)
            }
        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let d = segue.destinationViewController as? SwipeViewController {
            navigationController?.setNavigationBarHidden(true, animated: false)
        }
    }
}
