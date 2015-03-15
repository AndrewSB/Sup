//
//  PhoneNumberSettingsTableViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 3/4/15.
//  Copyright (c) 2015 asb. All rights reserved.
//

import UIKit

class AddFriendsViewController: UITableViewController {
    @IBOutlet weak var searchFeild: UITextField!
    @IBOutlet weak var addFriend: UIButton!
    @IBOutlet weak var friendUsername: UILabel!

    @IBAction func addFriendAction(sender: AnyObject) {
        var user = PFUser.currentUser()
        var friendToAdd = searchFeild.text
        var query = PFUser.query()
        query.whereKey("username", equalTo:friendToAdd)
        var friend = query.findObjects()
        var addFriend: [AnyObject] = user["friends"] as Array
        for(var i = 0; i < addFriend.count-1; i++){
            if(addFriend[i] as NSString == friendToAdd){
                friendToAdd = nil;
            }
        }
        if(friend != nil){
            addFriend.insert(friendToAdd, atIndex: addFriend.count-1)
            user.saveInBackgroundWithBlock(nil)
            println("itWorksBruh")
        }else{
            
        }
        
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
        return 1
    }
    
    
    
}
