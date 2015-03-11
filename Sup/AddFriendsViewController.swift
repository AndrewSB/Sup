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
        var friendToAdd = searchFeild.text
        var user = PFUser.currentUser()
        var friends: [AnyObject] = user["friends"] as Array
        var query = PFUser.query()
        query.whereKey("username", equalTo:friendToAdd)
        var friend = query.findObjects()
        for(var i = 0; i < friends.count-1; i++){
            if(friend[i] as NSString == friendToAdd){
                friend = nil;
            }
        }
        if(friend != nil){
            friendUsername.text = friendToAdd
            println(friends)
            friends.insert(friendToAdd, atIndex: friends.count)
            println(friends)
            user["friends"] = friends;
            user.saveInBackgroundWithBlock(nil)
        }else{
            let alert = UIAlertController(title: "Uh oh!", message: "User does not exist!", preferredStyle: .Alert)
            let ok = UIAlertAction(title: "Ok", style: .Cancel, handler: nil)
            alert.addAction(ok)
            self.presentViewController(alert, animated: true, completion: nil)
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
