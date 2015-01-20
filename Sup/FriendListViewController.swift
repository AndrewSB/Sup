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
        let image = UIImage(named: "A-10")
        cell?.imageView?.image = UIImage(
        cell?.textLabel?.text = "Donald Glover"
        cell?.detailTextLabel?.text = "Chilling with Jhene"
        
        return cell!
    }
}
