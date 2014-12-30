//
//  AppDelegate.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/28/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import TwitterKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Fabric.with([Crashlytics(), Twitter()])
        
        Parse.setApplicationId("fCots4c5CyFuKxLchx8JvYrC9NgmUoWqZVmbzBPj", clientKey: "qcMWYJoWmgqcLaks8Tq6I5btKTB25elTH1bzh3Ik")
        PFAnalytics.trackAppOpenedWithLaunchOptionsInBackground(launchOptions, block: nil)
        
        let attributes = [NSFontAttributeName as NSObject: UIFont(name: "Avenir-Black", size: 12) as AnyObject!, NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, forState: .Normal)
        
        return true
    }
}

