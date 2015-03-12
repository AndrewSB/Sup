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
    @IBOutlet weak var bio: UILabel!
    
    let app = UIApplication.sharedApplication()
    

    override func viewWillAppear(animated: Bool) {
        println((PFUser.currentUser()).objectForKey("email"))
        
        bio.text = PFUser.currentUser()["bio"] as String!
        usernameLabel.text = PFUser.currentUser().username
        mobileNumberLabel.text = PFUser.currentUser()["phone"] as String!
        emailLabel.text = PFUser.currentUser().email
        
        super.viewWillAppear(animated)
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("did select \(indexPath)")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 1:
                println()//self.performSegueWithIdentifier("segueToProfilePicture", sender: self)
            case 2:
                println()//self.performSegueWithIdentifier("segueToMobileNumber", sender: self)
            case 3:
                println()
            case 4:
                println()//self.performSegueWithIdentifier("segueToPassword", sender: self)
            default:
                println("switch failed section 0 \(indexPath.row)")
            }
        }
        if indexPath.section == 1 {
            switch indexPath.row {
            case 0:
                app.openURL(NSURL(string: "http://google.com")!)
            case 1:
                app.openURL(NSURL(string: "http://google.com")!)
            case 2:
                app.openURL(NSURL(string: "http://google.com")!)
            case 3:
                PFUser.logOut()
                let appDel = app.delegate as AppDelegate
                appDel.switchToLogin()
                
                
            default:
                println("switch failed section 1 \(indexPath.row)")
            }
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if let d = segue.destinationViewController as? SettingsDetailTableViewController {
//            
//        }
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }

    

}
