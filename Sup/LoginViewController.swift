//
//  ViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/28/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import TwitterKit
import ImageIO

class LoginViewController: UIViewController {
    @IBOutlet weak var webBG: UIWebView!
    @IBOutlet weak var logoNameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        logoNameLabel.transform = (CGAffineTransformMakeRotation(2*CGFloat(M_PI)))
        
        let authenticateButton = DGTAuthenticateButton(authenticationCompletion: {
            (session: DGTSession!, error: NSError!) in
            // play with Digits session
        })
        authenticateButton.center = self.view.center
        self.view.addSubview(authenticateButton)
    }
    
    func addBackground() {
        let filePath = NSBundle.mainBundle().pathForResource("railway", ofType: "gif")
        let gif: NSData! = NSData(contentsOfFile: filePath!)
        
        self.webBG.loadData(gif, MIMEType: "image/gif", textEncodingName: nil, baseURL: nil)
        self.webBG.userInteractionEnabled = false
    }



}

