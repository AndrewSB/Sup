//
//  ViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/28/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import TwitterKit


class WelcomeViewController: UIViewController {
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("at welcome")

        logInButton.setTitle("LOG\nIN", forState: .Normal)
        logInButton.titleLabel?.textAlignment = .Center
        
        signUpButton.setTitle("SIGN\nUP", forState: .Normal)
        signUpButton.titleLabel?.textAlignment = .Center
    }
    
    override func viewDidAppear(animated: Bool) {
        println("welcome appeared")
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func unwindToViewController (sender: UIStoryboardSegue){
        println("ayy you unwinded")
    }
}
