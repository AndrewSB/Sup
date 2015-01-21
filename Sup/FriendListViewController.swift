//
//  FriendListViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/30/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableV: UITableView!
    
    
    override func viewDidLoad() {
        tableV.delegate = self
        tableV.dataSource = self
        
        if self.tableV.respondsToSelector("layoutMargins") {
            self.tableV.layoutMargins = UIEdgeInsetsZero
        }
    
        super.viewDidLoad()
    }
    
    //Delegate
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//    }

    
    
    //DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellID") as? UITableViewCell
        if cell == nil {
            println("created at \(indexPath.row)")
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cellID")
        }
        
        if cell!.respondsToSelector("layoutMargins") {
            cell!.layoutMargins = UIEdgeInsetsZero
        }
        
        switch indexPath.row {
        case 0:
            println("config for self")
        case 1...3:
            println("config for favorite")
        default:
            println("config for rest")
        }
        
        cell!.imageView?.image = UIImage(named: "A-10")
        configureAvatarImage(cell!)
        cell!.textLabel?.text = "Donald Glover"
        cell!.detailTextLabel?.text = "Chilling with Jhene"
        
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
