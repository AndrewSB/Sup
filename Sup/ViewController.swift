//
//  ViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/28/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBackground()
        
        let authenticateButton = DGTAuthenticateButton(authenticationCompletion: {
            (session: DGTSession!, error: NSError!) in
            // play with Digits session
        })
        authenticateButton.center = self.view.center
        self.view.addSubview(authenticateButton)
    }
    
    func addBackground() {
        let filePath = NSBundle.mainBundle().pathForResource("railway", ofType: "gif")
        
        let webBG = UIWebView(frame: self.view.frame)
        webBG.loadData(NSData(contentsOfFile: filePath!), MIMEType: "image/gif", textEncodingName: nil, baseURL: nil)
        webBG.userInteractionEnabled = false
        self.view.addSubview(webBG)
    }



}

