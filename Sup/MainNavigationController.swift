//
//  MainNavigationController.swift
//  Sup
//
//  Created by Andrew Breckenridge on 12/29/14.
//  Copyright (c) 2014 asb. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        self.topViewController.loadView()
        super.viewDidLoad()
    }
    
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        
        let defaultSegue = super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
        let noAnimationSegue = PopNoAnimationSegue(identifier: identifier, source: fromViewController, destination: toViewController)
        
        if let id = identifier {
            switch id {
            case "unwindToWelcome":
                return noAnimationSegue
            default:
                return defaultSegue
            }
        }
        return defaultSegue
    }
    
}
