//
//  SignupViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/29/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    @IBOutlet weak var emailTextField: WTReTextField!
    @IBOutlet weak var usernameTextField: WTReTextField!
    @IBOutlet weak var passwordTextField: WTReTextField!
    
    
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
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        println("custom unwinded")
        let segue = PushNoAnimationSegue(identifier: identifier, source: fromViewController, destination: toViewController)
        return segue
    }
    
    func unwind() {
        println("unwinded")
        
        setNavBarColor(UIColor(red: 0.136, green: 0.859, blue: 0.112, alpha: 1))
        
        performSegueWithIdentifier("unwindToWelcome", sender: self)
    }
    
    func setNavBarColor(color: UIColor) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        navigationController?.navigationBar.barTintColor = color
        CATransaction.commit()

    }
}
