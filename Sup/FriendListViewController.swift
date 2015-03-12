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
        self.tableV.reloadData()
        super.viewDidLoad()
        var user = PFUser.currentUser()
        var friends: AnyObject! = user["friends"]
        
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
            user.saveInBackgroundWithBlock(nil);
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
        var user = PFUser.currentUser()
        var x: AnyObject! = user["status"]
        if(statusSwitch.on){
            user["status"] = true;
            
        }else{
            user["status"] = false;
        }
        user.saveInBackgroundWithBlock(nil)
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellID") as? UITableViewCell
        if cell == nil {
            println("created at \(indexPath.row)")
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cellID")
        }
        var statusLabel: UILabel = UILabel (frame:CGRectMake(253, 20, 42, 21));
        cell?.contentView.addSubview(statusLabel)
        statusLabel.userInteractionEnabled = true;
        statusLabel.multipleTouchEnabled = true;
        statusLabel.highlighted = true;
        if((cell?.selected) != nil){
        cell?.backgroundColor = UIColor.whiteColor()
        }
        var user = PFUser.currentUser()
        if(user["bio"] == nil){
            user["bio"] = "I dont have a bio yet!"
        }
        var label: AnyObject! = ""
        configureAvatarImage(cell!)
        var friends: [AnyObject] = user["friends"] as Array
        var bioArray = [""]
        var statusArray = [""]
        var pictureArray = [] as NSMutableArray
        var pictureUrl = [""]
        var query = PFUser.query()
        query.whereKey("username", equalTo:friends[0])
        var friendsArray = query.findObjects()
        println(friendsArray)
        for(var i = 0; i < friends.count; i++){
            
            var bios : AnyObject = friendsArray[0]["bio"] as String
            var status : AnyObject = friendsArray[0]["status"] as NSObject
            var profilePicture: AnyObject = friendsArray[0]["profilePicture"] as PFFile
            bioArray.insert("\(bios)", atIndex: bioArray.count-1)
            statusArray.insert("\(status)", atIndex: statusArray.count-1)
            pictureArray.addObject(profilePicture)
            pictureUrl.insert(pictureArray[i].url, atIndex: pictureUrl.count-1)
        }
        println(friends)
        println(bioArray)
        println(statusArray)
        println(pictureArray)
        println(pictureUrl)
        for(var i = 0; i < friends.count; i++){
            var friendsLabel: AnyObject = friends[indexPath.row]
            cell!.textLabel?.text = "\(friendsLabel)"
            var eachBio : AnyObject = bioArray[indexPath.row]
            var stringRepresentation = "\(eachBio)"
            cell!.detailTextLabel?.text = stringRepresentation;
            var statuses = statusArray[indexPath.row]
            statusLabel.text = "\(statuses)"
            var profilePictures: AnyObject = pictureUrl[indexPath.row]
            let url = NSURL(string: "\(profilePictures)")
            let data = NSData(contentsOfURL: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check
            cell!.imageView?.image = UIImage(data: data!)
            if("\(statuses)" == "1"){
                statusLabel.backgroundColor = UIColor.greenColor()
            }else{
                statusLabel.backgroundColor = UIColor.redColor()
            }
        }
        
        
        // Make a new post
        switch indexPath.row {
        case 0:
            println("config for rest")
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
