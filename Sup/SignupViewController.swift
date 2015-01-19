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
        setNavBarColor(UIColor(red: 1, green: 0.293, blue: 0.279, alpha: 1), translucent: false)
        super.loadView()
    }
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let backButton = UIBarButtonItem(image: UIImage(named: "back"), style: .Plain, target: self, action: "unwind")
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.setLeftBarButtonItem(backButton, animated: true)
        
        emailTextField.becomeFirstResponder()
        emailTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func unwind() {
        setNavBarColor(UIColor(red: 0.136, green: 0.859, blue: 0.112, alpha: 1), translucent: true)
        performSegueWithIdentifier("unwindToWelcome", sender: self)
    }
    
    func setNavBarColor(color: UIColor, translucent: Bool) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        navigationController?.navigationBar.barTintColor = color
        navigationController?.navigationBar.translucent = translucent
        CATransaction.commit()
    }
    
    @IBAction func signupButtonHit(sender: AnyObject) {
        //validate
        let user = PFUser()
        user.username = usernameTextField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        user.email = emailTextField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        user.password = passwordTextField.text.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        user.signUpInBackgroundWithBlock({(succeeded, error) in
            if error == nil {
                self.navigationController?.popToRootViewControllerAnimated(false)
            } else {
                let alert = UIAlertController(title: "Uh oh!", message: "\(error.userInfo)", preferredStyle: .Alert)
                let ok = UIAlertAction(title: "Ok", style: .Cancel, handler: nil)
                alert.addAction(ok)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        })
    }
}
