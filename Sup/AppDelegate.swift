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


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Fabric.with([Crashlytics()])
        
        Parse.enableLocalDatastore()
        if let keys = NSBundle.mainBundle().pathForResource("API-Keys", ofType: "plist") {
            let rootDict = NSDictionary(contentsOfFile: keys)
            let p = rootDict!["Parse"] as Dictionary<String, String>
            Parse.setApplicationId(p["ApplicationID"], clientKey: p["ClientKey"])
        } else {
            fatalError("You don't have access to the API Keys")
        }

        PFAnalytics.trackAppOpenedWithLaunchOptionsInBackground(launchOptions, block: nil)
        
        let attributes = [NSFontAttributeName as NSObject: UIFont(name: "Avenir-Black", size: 15) as AnyObject!, NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, forState: .Normal)
        
        println(self.window?.rootViewController)
        
        println()
        
        return true
    }
    
    func logout() {
        PFUser.logOut()
        let mainNav = self.window?.rootViewController as MainNavigationController
        mainNav.popToRootViewControllerAnimated(false)
    }
}

