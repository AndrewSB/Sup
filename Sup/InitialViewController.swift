//
//  InitialViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/29/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {
    override func viewDidAppear(animated: Bool) {
        println("initial did appear")
        let loggedIn = PFUser.currentUser() != nil
        
        if loggedIn {
            performSegueWithIdentifier("segueToMain", sender: self)
        } else {
            performSegueWithIdentifier("segueToWelcome", sender: self)
        }
    }
    
    @IBAction func unwindToInitial (sender: UIStoryboardSegue){
        println("unwinded to initial")
    }
}
