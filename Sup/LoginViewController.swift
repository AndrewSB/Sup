//
//  ViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/28/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import QuartzCore
import TwitterKit


class LoginViewController: UIViewController {
    @IBOutlet weak var webBG: UIWebView!
    @IBOutlet weak var logoNameLabel: UILabel!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        let authenticateButton = DGTAuthenticateButton(authenticationCompletion: {
            (session: DGTSession!, error: NSError!) in
            // play with Digits session
        })
        authenticateButton.center = self.view.center
        self.view.addSubview(authenticateButton)
        
        let logInButton = TWTRLogInButton(logInCompletion: {
            (session: TWTRSession!, error: NSError!) in
            // play with Twitter session
        })
        logInButton.center = CGPoint(x: 50, y: 10)
        self.view.addSubview(logInButton)
        
        println(authenticateButton.tintColor?)

        self.phoneButton.layer.cornerRadius = 5
        self.emailButton.layer.cornerRadius = 5
        
        logoNameLabel.transform = (CGAffineTransformMakeRotation(2*CGFloat(M_PI)))
    }
    
    func addBackground() {
        let filePath = NSBundle.mainBundle().pathForResource("railway", ofType: "gif")
        let gif: NSData! = NSData(contentsOfFile: filePath!)
        
        self.webBG.loadData(gif, MIMEType: "image/gif", textEncodingName: nil, baseURL: nil)
        self.webBG.userInteractionEnabled = false
    }

    @IBAction func didHitEmailButton(sender: AnyObject) {
    }


}

