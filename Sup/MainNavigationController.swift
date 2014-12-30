//
//  MainNavigationController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/29/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        println("unwind delegated at navcon")
        return PopNoAnimationSegue(identifier: identifier, source: fromViewController, destination: toViewController)
    }
}
