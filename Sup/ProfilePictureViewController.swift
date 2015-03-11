//
//  PhoneNumberSettingsTableViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 3/4/15.
//  Copyright (c) 2015 asb. All rights reserved.
//

import UIKit

class ProfilePictureViewController: UITableViewController,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate {
        @IBOutlet weak var getImage: UIButton!
    var picker:UIImagePickerController?=UIImagePickerController()
    var popover:UIPopoverController?=nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    @IBAction func getImage(sender: AnyObject)
    {
        var alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        
        var cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.Default)
            {
                UIAlertAction in
                self.openCamera()
                
        }
        var gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertActionStyle.Default)
            {
                UIAlertAction in
                self.openGallary()
        }
        var cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel)
            {
                UIAlertAction in
                
        }
        
        // Add the actions
        alert.addAction(cameraAction)
        alert.addAction(gallaryAction)
        alert.addAction(cancelAction)
        // Present the controller
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else
        {
            popover=UIPopoverController(contentViewController: alert)
            popover!.presentPopoverFromRect(getImage.frame, inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
        }
    }
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera))
        {
            picker!.sourceType = UIImagePickerControllerSourceType.Camera
            self .presentViewController(picker!, animated: true, completion: nil)
            var user = PFUser.currentUser()
            user["profilePicture"] = [UIImagePickerControllerOriginalImage]
            user.saveInBackgroundWithBlock(nil)
        }
        else
        {
            openGallary()
        }
    }
    func openGallary()
    {
        picker!.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone
        {
            self.presentViewController(picker!, animated: true, completion: nil)
        }
        else
        {
            popover=UIPopoverController(contentViewController: picker!)
            popover!.presentPopoverFromRect(getImage.frame, inView: self.view, permittedArrowDirections: UIPopoverArrowDirection.Any, animated: true)
        }
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!)
    {
        var user = PFUser.currentUser()
        user["profilePicture"] = info[UIImagePickerControllerOriginalImage] as? UIImage
        user.saveInBackgroundWithBlock(nil)
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(picker: UIImagePickerController!)
    {
        println("picker cancel.")
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
