//
//  ViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/28/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import QuartzCore

class LoginViewController: UIViewController {
    @IBOutlet weak var webBG: UIWebView!
    @IBOutlet weak var logoNameLabel: UILabel!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        addBackground()
        
        // Using pallete http://www.colourlovers.com/palette/2316406/G2K_Followers

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

