//
//  SwipeViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 1/5/15.
//  Copyright (c) 2015 asb. All rights reserved.
//

import UIKit

class SwipeViewController : YZSwipeBetweenViewController {
    let settingsStoryboard = UIStoryboard(name: "Settings", bundle: NSBundle.mainBundle())
    let FriendsList = UIStoryboard(name: "FriendsListViewController", bundle: NSBundle.mainBundle())
    override func viewWillAppear(animated : Bool) {
        super.viewWillAppear(animated)

        viewControllers = [FriendsList.instantiateViewControllerWithIdentifier("FriendsListViewController") as UINavigationController, storyboard?.instantiateViewControllerWithIdentifier("friendListNavCon") as UINavigationController, settingsStoryboard.instantiateViewControllerWithIdentifier("settingsNavCon") as UINavigationController]
    }
}
