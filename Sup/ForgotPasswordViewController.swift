//
//  ForgotPasswordViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/30/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        emailTextField.delegate = self
    }
    
    
    @IBAction func didHitCancel(sender: AnyObject) {
        performSegueWithIdentifier("unwindToLogin", sender: self)
    }
    
    @IBAction func submitButtonHit(sender: AnyObject) {
        //validate input
        let user = PFUser()
        user
    }
}
