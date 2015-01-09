//
//  FriendListTableViewCell.swift
//  Sup
//
//  Created by Andrew Breckenridge on 1/6/15.
//  Copyright (c) 2015 asb. All rights reserved.
//

import UIKit

class FriendListTableViewCell: UITableViewCell {
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var statusImageView: UIImageView!
    
    override init() {
        super.init(style: .Default, reuseIdentifier: "cellID")
    }
    
    init(picture: String?, name: String, status: String?, green: Bool) {
        if let st = status {
            super.init(style: .Subtitle, reuseIdentifier: "cellID")
            detailTextLabel?.text = st
        } else {
            super.init(style: .Default, reuseIdentifier: "cellID")
        }
        
        textLabel?.text = name
        if let p = picture {
            profilePictureImageView = UIImageView(image: UIImage(named: p)!)
        }
        
        statusImageView = green ? UIImageView(image: UIImage(named: "green")!) : UIImageView(image: UIImage(named: "red")!)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    

}
