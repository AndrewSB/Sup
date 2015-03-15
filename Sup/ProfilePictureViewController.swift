//
//  FriendListViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/30/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit;
import MobileCoreServices

class ProfilePictureViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate{
    @IBOutlet weak var tableV: UITableView!
    @IBOutlet weak var btnClickMe: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var picker:UIImagePickerController?=UIImagePickerController()
    var popover:UIPopoverController?=nil
    override func loadView() {
        super.loadView()
    }
    override func viewDidLoad() {
        tableV.delegate = self
        tableV.dataSource = self
        self.tableV.reloadData()
        super.viewDidLoad()
    }
    
    
    
    //Delegate
    //    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    //    }
    
    
    
    //DataSource
    
    @IBAction func btnImagePickerClicked(sender: AnyObject){
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePicker.mediaTypes = [kUTTypeImage as NSString]
        imagePicker.allowsEditing = false
        
        self.presentViewController(imagePicker, animated: true,
            completion: nil)
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
            var user = PFUser.currentUser()
            let image = info[UIImagePickerControllerOriginalImage] as UIImage
            let imageData = UIImageJPEGRepresentation(image, 0.05)
            let imageFile = PFFile(name:"image.jpg", data:imageData)
            user["profilePicture"] = imageFile;
            user.saveInBackgroundWithBlock(nil)
            
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
            var user = PFUser.currentUser()
            let image = info[UIImagePickerControllerOriginalImage] as UIImage
            let imageData = UIImageJPEGRepresentation(image, 0.05)
            let imageFile = PFFile(name:"image.jpg", data:imageData)
            user["profilePicture"] = imageFile;
            user.saveInBackgroundWithBlock(nil)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1;
        }
        
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cellID") as? UITableViewCell
        if cell == nil {
            println("created at \(indexPath.row)")
            cell = UITableViewCell(style: .Default, reuseIdentifier: "cellID")
        }
        
        
        // Make a new post
        switch indexPath.row {
        case 0:
            cell!.textLabel?.text = "jews?"
            cell!.detailTextLabel?.text = "jews?"
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
