//
//  ViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/28/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit


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
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    @IBAction func testButtonhit(sender: AnyObject) {
    }
    
    @IBAction func unwindToWelcome (sender: UIStoryboardSegue){
        if let s = sender.sourceViewController as? LoginViewController {
            println("should have segued back")
            self.performSegueWithIdentifier("unwindToInitial", sender: self)
        } else {
            println("wasn't loginvc")
            println(sender.sourceViewController)
        }
    }
}
