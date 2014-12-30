//
//  SignupViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/29/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    
    override func loadView() {
        setNavBarColor(UIColor(red: 1, green: 0.293, blue: 0.279, alpha: 1))
        super.loadView()
    }
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let backButton = UIBarButtonItem(title: "<", style: .Plain, target: self, action: "unwind")
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.setLeftBarButtonItem(backButton, animated: true)
        
        emailTextField.becomeFirstResponder()
        emailTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func unwind() {
        setNavBarColor(UIColor(red: 0.136, green: 0.859, blue: 0.112, alpha: 1))
        performSegueWithIdentifier("unwindToWelcome", sender: self)
    }
    
    func setNavBarColor(color: UIColor) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        navigationController?.navigationBar.barTintColor = color
        CATransaction.commit()
    }
    
    @IBAction func signupButtonHit(sender: AnyObject) {
        //validate
        let user = PFUser()
        user.username = usernameTextField.text
        user.email = emailTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackgroundWithBlock({(succeeded, error) in
            if error == nil {
                println("sign up successful, segue to main")
            } else {
                let eString = error.userInfo?.indexForKey("error")
                println(eString)
            }
        })
    }
}
