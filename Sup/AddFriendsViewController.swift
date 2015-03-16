//
//  FriendListViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/30/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit

class AddFriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func loadView() {
        super.loadView()
    }
    
    
    
    //Delegate
    //    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    //    }
    
    
    
    //DataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1;
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellID") as? UITableViewCell
        if cell == nil {
            println("created at \(indexPath.row)")
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cellID")
        }
        var addButton: UIButton = UIButton (frame:CGRectMake(253, 20, 42, 21));
        // Make a new post
        switch indexPath.row {
        case 0:
            println("config for self")
        default:
            println("config for rest")
        }
        return cell!
    }
    
    
    func configureAvatarImage(cell: UITableViewCell) {
        let itemSize = CGSizeMake(20, 20);
        UIGraphicsBeginImageContextWithOptions(itemSize, false, UIScreen.mainScreen().scale);
        let imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
        cell.imageView?.image?.drawInRect(imageRect)
        cell.imageView?.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
}
