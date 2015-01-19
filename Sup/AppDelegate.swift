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
        startParse(launchOptions)
        PFUser.logOut()
        let loggedIn = PFUser.currentUser() != nil
        
        Fabric.with([Crashlytics()])
        
        applyFormatting()
        
        let storyboard = loggedIn ? "Main" : "Login"
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = (UIStoryboard(name: storyboard, bundle: NSBundle.mainBundle()).instantiateInitialViewController() as UIViewController)
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func startParse(lo: [NSObject: AnyObject]?) {
        Parse.enableLocalDatastore()
        if let keys = NSBundle.mainBundle().pathForResource("API-Keys", ofType: "plist") {
            let rootDict = NSDictionary(contentsOfFile: keys)
            let p = rootDict!["Parse"] as Dictionary<String, String>
            Parse.setApplicationId(p["ApplicationID"], clientKey: p["ClientKey"])
        } else {
            fatalError("You don't have access to the API Keys")
        }
        PFAnalytics.trackAppOpenedWithLaunchOptionsInBackground(lo, block: nil)
    }
    
    func applyFormatting() {
        let attributes = [NSFontAttributeName as NSObject: UIFont(name: "Avenir-Black", size: 15) as AnyObject!, NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, forState: .Normal)
    }
    
    func switchToMain() {
        
    }
    
    func switchToLogin() {
        
    }
    
    
    func logout() {
        PFUser.logOut()
        let mainNav = self.window?.rootViewController as MainNavigationController
        mainNav.popToRootViewControllerAnimated(false)
    }
}

