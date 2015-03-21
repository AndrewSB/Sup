//
//  SignupViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/29/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    let appDel = UIApplication.sharedApplication().delegate as AppDelegate
    
    
    override func loadView() {
        setNavBarColor(UIColor(red: 1, green: 0.293, blue: 0.279, alpha: 1), translucent: false)
        super.loadView()
    }
    
    override func viewDidLoad() {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let backButton = UIBarButtonItem(image: UIImage(named: "back"), style: .Plain, target: self, action: "unwind")
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.setLeftBarButtonItem(backButton, animated: true)
        
        emailTextField.becomeFirstResponder()
        emailTextField.delegate = self
        usernameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func unwind() {
        setNavBarColor(UIColor(red: 0.136, green: 0.859, blue: 0.112, alpha: 1), translucent: true)
        performSegueWithIdentifier("unwindToWelcome", sender: self)
    }
    
    func setNavBarColor(color: UIColor, translucent: Bool) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        navigationController?.navigationBar.barTintColor = color
        navigationController?.navigationBar.translucent = translucent
        CATransaction.commit()
    }
    
    @IBAction func signupButtonHit(sender: AnyObject) {
        //validate
        let user = PFUser()
        user.username = usernameTextField.text
        user.email = emailTextField.text
        user.password = passwordTextField.text
        
        user.signUpInBackgroundWithBlock({(succeeded, error) in
            if error == nil {
                var user = PFUser.currentUser()
                println("1")
                var username: AnyObject = user.username
                println("\(username)")
                user["friends"] = ["\(username)"];
                user["status"] = true;
                user["bio"] = "I dont have A bio yet!";
                let url = NSURL(string: "http://www.icao.int/Meetings/SIAS/PublishingImages/Blank%20profile%20pic.png?Mobile=1&Source=%2FMeetings%2FSIAS%2F_layouts%2Fmobile%2Fdispform.aspx%3FList%3Dcf2ac419-73a3-4217-b85c-578251f49478%26View%3D529f1e34-9369-49db-bd14-1134ad40abf7%26ID%3D27%26CurrentPage%3D1")
                let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
                var image = UIImage(data: data!)
                println("2")
                let imageData = UIImageJPEGRepresentation(image, 0.05)
                println("3")
                let imageFile = PFFile(name:"image.jpg", data:imageData)
                println("4")
                user["profilePicture"] = imageFile;
                user.saveInBackgroundWithBlock(nil)
                println("5")
                self.appDel.switchToMain()
            } else {
                let alert = UIAlertController(title: "Uh oh!", message: "\(error.userInfo)", preferredStyle: .Alert)
                let ok = UIAlertAction(title: "Ok", style: .Cancel, handler: nil)
                alert.addAction(ok)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        })
    }
}
