//
//  FriendListViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/30/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import MessageUI

class FriendListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableV: UITableView!
    @IBOutlet weak var statusSwitch: UISwitch!
    
    override func loadView() {
        super.loadView()
    }
    var backgroundColor = UIColor.greenColor()
    var label: AnyObject! = ""
    var bioArray = [""]
    var statusArray = [""]
    var pictureArray = [] as NSMutableArray
    var pictureUrl = [""]
    override func viewDidLoad() {
        bioArray = [""]
        statusArray = [""]
        pictureArray = [] as NSMutableArray
        pictureUrl = [""]
        tableV.delegate = self
        tableV.dataSource = self
        super.viewDidLoad()
        var user = PFUser.currentUser()
        var friends: [AnyObject] = user["friends"] as Array
        for(var i = 0; i < friends.count; i++){
        var query = PFUser.query()
        query.whereKey("username", equalTo:friends[i])
        var friendsArray = query.findObjects()
            
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
        if(user["status"] as NSObject == true){
            statusSwitch.setOn(true, animated: false)
        }else{
            statusSwitch.setOn(false, animated: false)
        }
    }
    @IBAction func sendMessage(sender: AnyObject) {
        var messageVC = MFMessageComposeViewController()
        
        messageVC.body = "ur a fucking homosexual";
        messageVC.recipients = ["5157242794"]
    
        self.presentViewController(messageVC, animated: false, completion: nil)
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
            backgroundColor = UIColor.greenColor()
            
        }else{
            user["status"] = false;
            backgroundColor = UIColor.redColor()
        }
        user.saveInBackgroundWithBlock(nil)
        self.tableV.reloadData()
    }
    @IBAction func reloadTableView(sender: AnyObject) {
        viewDidLoad()
        self.tableV.reloadData()
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
        
        configureAvatarImage(cell!)
        var friends: [AnyObject] = user["friends"] as Array
        for(var i = 0; i < friends.count; i++){
            var friendsLabel: AnyObject = friends[indexPath.row]
            cell!.textLabel?.text = "\(friendsLabel)"
            var eachBio : AnyObject = bioArray[indexPath.row]
            var stringRepresentation = "\(eachBio)"
            cell!.detailTextLabel?.text = stringRepresentation;
            var statuses = statusArray[indexPath.row]
            statusLabel.text = ""
            var profilePictures: AnyObject = pictureUrl[indexPath.row]
            let url = NSURL(string: "\(profilePictures)")
            let data = NSData(contentsOfURL: url!)
            cell!.imageView?.image = UIImage(data: data!)
            if("\(statuses)" == "1"){
                cell?.backgroundColor = UIColor.greenColor()
            }else{
                cell?.backgroundColor = UIColor.redColor()
            }
        }
        if(statusSwitch.on){
            backgroundColor = UIColor.greenColor()
            
        }else{
            backgroundColor = UIColor.redColor()
        }
        
        // Make a new post
        switch indexPath.row {
        case 0:
            cell?.backgroundColor = backgroundColor
            println("case 0")
            if(cell?.selected != false){
                
            }
        default:
            println("case default")
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
