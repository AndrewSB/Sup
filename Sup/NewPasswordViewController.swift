//
//  PhoneNumberSettingsTableViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 3/4/15.
//  Copyright (c) 2015 asb. All rights reserved.
//

import UIKit

class NewPasswordViewController: UITableViewController {
    @IBOutlet weak var email1: UITextField!
    
    @IBAction func phoneNumber(sender: AnyObject) {
        var user = PFUser.currentUser()
        var email: AnyObject! = user["email"]
        PFUser.requestPasswordResetForEmailInBackground(email1.text, target: email1.text, selector: Selector())
            let alertController = UIAlertController(title: "Reset Password", message:
                "Reset instructions sent to \(email)", preferredStyle: UIAlertControllerStyle.Alert)
            
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 2
    }
    
    
    
}
