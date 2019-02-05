//
//  UINavigationController.swift
//  Command
//
//  Created by Zachary Shakked on 1/31/19.
//  Copyright © 2019 Zachary Shakked. All rights reserved.
//

import UIKit

public extension UINavigationController {
    
    public func push(_ controller: UIViewController, animated: Bool = true) {
        pushViewController(controller, animated: animated)
    }
    
    
}
