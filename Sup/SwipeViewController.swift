//
//  SwipeViewController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 1/5/15.
//  Copyright (c) 2015 asb. All rights reserved.
//

import UIKit

class SwipeViewController: YZSwipeBetweenViewController {
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        viewControllers = [storyboard?.instantiateViewControllerWithIdentifier("friendListVC") as UIViewController, storyboard?.instantiateViewControllerWithIdentifier("settingsVC") as UIViewController]
    }
}
