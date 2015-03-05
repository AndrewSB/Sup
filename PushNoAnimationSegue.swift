//
//  PushNoAnimationSegue.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/29/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit
@objc(PushNoAnimationSegue)

class PushNoAnimationSegue: UIStoryboardSegue {
    override func perform() {
        let source = sourceViewController as UIViewController
        if let navigation = source.navigationController {
            navigation.pushViewController(destinationViewController as UIViewController, animated: false)
        } else {
            println("navigation is not source navigation controller")
        }
    }
}
