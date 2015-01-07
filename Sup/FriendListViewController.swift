//
//  FriendListViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/30/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController {
    @IBOutlet weak var friendListTableView: FriendListTableView!
    var detailID: String = ""
    
    override func viewDidLoad() {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
}
