//
//  FriendListTableView.swift
//  Sup
//
//  Created by Andrew Breckenridge on 1/5/15.
//  Copyright (c) 2015 asb. All rights reserved.
//

import UIKit

class FriendListTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    let cellIdentifier = "cellID"
    let VC = FriendListViewController()
    let appDelegate = UIApplication.sharedApplication()
    
    // Data Source
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier) as UITableViewCell
        
        cell.textLabel?.text = "Woot"
        
        return cell
    }
    
    
    // Delegate
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        var id: String
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                id = "Username"
            case 1:
                id = "Profile Picture"
            case 2:
                id = "Mobile Number"
            case 3:
                id = "Email"
            case 4:
                id = "Password"
            default:
                fatalError("unrecognized row in section 0 (\(indexPath.row))")
            }
        case 1:
            switch indexPath.row {
            case 0:
                appDelegate.openURL(NSURL(string: "http://www.google.com")!)
            case 1:
                appDelegate.openURL(NSURL(string: "http://www.google.com")!)
            case 2:
                appDelegate.openURL(NSURL(string: "http://www.google.com")!)
            case 3:
                PFUser.logOut()
                id = "Logout"
            default:
                fatalError("unrecognized row in section 1 (\(indexPath.row))")
            }
        default:
            fatalError("unrecognized section (\(indexPath.section))")
        }
        VC.performSegueWithIdentifier("showDetailSegue", sender: self)
    }
}
