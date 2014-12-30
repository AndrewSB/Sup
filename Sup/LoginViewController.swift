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
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let backButton = UIBarButtonItem(title: "<", style: .Plain, target: self, action: "unwind")
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.setLeftBarButtonItem(backButton, animated: true)
        
        usernameTextField.becomeFirstResponder()
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        println("custom unwinded")
        let segue = PushNoAnimationSegue(identifier: identifier, source: fromViewController, destination: toViewController)
        return segue
    }
    
    func unwind() {
        println("unwinded")
        performSegueWithIdentifier("unwindToWelcome", sender: self)
    }
}
