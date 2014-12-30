//
//  ForgotPasswordViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/30/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBAction func didHitCancel(sender: AnyObject) {
        performSegueWithIdentifier("unwindToLogin", sender: self)
    }
}
