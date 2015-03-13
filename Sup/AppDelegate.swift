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
            Parse.setApplicationId("j0Q5Z5SwEzwWIgFdFez84BHW3GRx3ve8sue5Ag65",
            clientKey:"LHziz1giCVpc6TLKXzkl9ZUkx4SjT6HaqjYfu8Oa")
        PFAnalytics.trackAppOpenedWithLaunchOptionsInBackground(lo, block: nil)
    }
    
    func applyFormatting() {
        let attributes = [NSFontAttributeName as NSObject: UIFont(name: "Avenir-Black", size: 15) as AnyObject!, NSForegroundColorAttributeName: UIColor.whiteColor()]
        UIBarButtonItem.appearance().setTitleTextAttributes(attributes, forState: .Normal)
    }
    
    func switchToMain() {
        window?.rootViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateInitialViewController() as? UIViewController
    }
    
    func switchToLogin() {
        window?.rootViewController = UIStoryboard(name: "Login", bundle: NSBundle.mainBundle()).instantiateInitialViewController() as? UIViewController
    }

    
    func logout() {
        PFUser.logOut()
        let mainNav = self.window?.rootViewController as MainNavigationController
        mainNav.popToRootViewControllerAnimated(true)
    }
}

