//
//  SettingsTableViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 1/6/15.
//  Copyright (c) 2015 asb. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var mobileNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    let app = UIApplication.sharedApplication()
    

    override func viewWillAppear(animated: Bool) {
        println((PFUser.currentUser()).objectForKey("email"))
        
        
        usernameLabel.text = PFUser.currentUser().email
        mobileNumberLabel.text = PFUser.currentUser()["phoneNumber"] as String!
        emailLabel.text = PFUser.currentUser().email
        
        super.viewWillAppear(animated)
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("did select \(indexPath)")
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                app.openURL(NSURL(string: "http://google.com")!)
            case 1:
                app.openURL(NSURL(string: "http://google.com")!)
            case 2:
                app.openURL(NSURL(string: "http://google.com")!)
            case 3:
                let appDel = app.delegate as AppDelegate
                appDel.logout()
                
            default:
                println("switch failed section 1")
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
