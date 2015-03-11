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
    @IBOutlet weak var statusSwitch: UISwitch!
    
    override func loadView() {
        super.loadView()
    }
    
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
        var user = PFUser.currentUser()
        var friends: AnyObject! = user["friends"];
        if(friends == nil){
            var username: AnyObject = user.username
            println("\(username)")
            user["friends"] = ["\(username)"];
            user.save();
        }
        var x = friends.count;
        println(friends)
        if(x != nil){
            return x;
        }else{
            return 1;
        }
        
    }
    
    @IBAction func status(sender: AnyObject) {

    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellID") as? UITableViewCell
        if cell == nil {
            println("created at \(indexPath.row)")
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cellID")
        }
        var status: UILabel = UILabel (frame:CGRectMake(253, 84, 42, 21));
        cell?.contentView.addSubview(status)
        status.userInteractionEnabled = true;
        status.multipleTouchEnabled = true;
        status.highlighted = true;
        
        var user = PFUser.currentUser()
        switch indexPath.row {
        case 0:
            println("config for self")
        case 1...3:
            println("config for favorite")
        default:
            println("config for rest")
        }
        if let userImageFile = user["profileImage"] as? PFFile {
            userImageFile.getDataInBackgroundWithBlock {
                (imageData: NSData!, error: NSError!) -> Void in
                if error == nil {
                    if imageData != nil{
                        let image = UIImage(data:imageData)
                        cell!.imageView?.image = image;
                    }
                }
            }
        }
        if(user["bio"] == nil){
            user["bio"] = "I dont have a bio yet!"
        }
        var label: AnyObject! = ""
        configureAvatarImage(cell!)
        var friends: [AnyObject] = user["friends"] as Array
        var bioArray = [""]
        var statusArray = [""] as Array
        for(var i = 0; i < friends.count; i++){
            var query = PFUser.query()
            query.whereKey("username", equalTo:friends[i])
            var friendsArray = query.findObjects()
            var bios : AnyObject = friendsArray[0]["bio"] as String
            var status : AnyObject = friendsArray[0]["status"] as NSObject
            bioArray.insert("\(bios)", atIndex: bioArray.count-1)
            statusArray.insert("\(status)", atIndex: statusArray.count-1)
            
        }
        statusArray.removeAtIndex(statusArray.count-1)
        println(friends)
        println(friends[0])
        println(bioArray)
        println(statusArray)
        println(friends.count)
        for(var i = 0; i < friends.count; i++){
            var friendsLabel: AnyObject = friends[indexPath.row]
            cell!.textLabel?.text = "\(friendsLabel)"
            var eachBio : AnyObject = bioArray[indexPath.row]
            var stringRepresentation = "\(eachBio)"
            cell!.detailTextLabel?.text = stringRepresentation;
            var statuses = statusArray[indexPath.row]
            status.text = "\(statuses)"
            if("\(statuses)" == "1"){
                status.backgroundColor = UIColor.greenColor()
            }else{
                status.backgroundColor = UIColor.redColor()
            }
        }
        
        
        // Make a new post
        
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
