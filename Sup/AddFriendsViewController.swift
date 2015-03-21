//
//  FriendListViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/30/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit

class AddFriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var addbutton: UIBarButtonItem!
    @IBOutlet weak var addUsername: UITextField!
    @IBOutlet var tableV: UITableView!
    
    override func loadView() {
        super.loadView()
        var swipeRight = UISwipeGestureRecognizer(target: self, action: "respondToSwipeGesture:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    
    
    //Delegate
    //    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    //    }
    
    
    var friendsArray = []
    var userArray = [""]
    var bioArray = [""]
    //DataSource
    func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                addUsername.resignFirstResponder()
            default:
                break
            }
        }
    }
    @IBAction func addButtonClicked(sender: AnyObject) {
        var query = PFUser.query()
        var user = PFUser.currentUser()
        var friends: [AnyObject] = user["friends"] as Array
        query.whereKey("username", equalTo:addUsername.text)
        friendsArray = query.findObjects()
        if(friendsArray.count != 0){
            for i in friendsArray{
                var bios : AnyObject = friendsArray[0].username as String
                var status : AnyObject = friendsArray[0]["bio"] as NSObject
                bioArray.insert("\(status)", atIndex: bioArray.count-1)
                userArray.insert("\(bios)", atIndex: userArray.count-1)
            }
        }
        println(bioArray)
        println(userArray)
        addUsername.resignFirstResponder()
        self.tableV.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return friendsArray.count;
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellID") as? UITableViewCell
        if cell == nil {
            println("created at \(indexPath.row)")
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cellID")
        }
        var Friendbutton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        Friendbutton.addTarget(self, action:"addFriendToList:", forControlEvents:UIControlEvents.TouchUpInside)
        Friendbutton.frame = CGRectMake(253, 20, 42, 21);
        Friendbutton.backgroundColor = UIColor.greenColor()
        Friendbutton.setTitle("Add", forState: UIControlState.Normal)
        self.view.addSubview(Friendbutton)
        // Make a new post
        
        switch indexPath.row {
        case 0:
            cell!.textLabel?.text = friendsArray[0].username
            cell!.detailTextLabel?.text = bioArray[0]
        default:
            println("config for rest")
        }
        return cell!
    }
    func addFriendToList(Friendbutton: UIButton!){
        var user = PFUser.currentUser()
        var friends: [AnyObject] = user["friends"] as Array
        var userToAdd = addUsername.text
        var numOfFriends = friends.count
        for(var i = 0; i < friends.count; i++){
            if(addUsername.text == "\(friends[i])" || addUsername.text == nil){
                userToAdd = nil;
                let alert = UIAlertController(title: "Uh oh!", message:  "\(friendsArray[0].username) is already your friend", preferredStyle: .Alert)
                let ok = UIAlertAction(title: "Ok", style: .Cancel, handler: nil)
                alert.addAction(ok)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
        if(userToAdd != nil){
            friends.insert(addUsername.text, atIndex: numOfFriends)
            user["friends"] = friends
            user.saveEventually()
        }
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
