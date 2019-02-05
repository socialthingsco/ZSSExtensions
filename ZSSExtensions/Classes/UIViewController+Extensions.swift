//
//  UIViewController+Extensions.swift
//  Command
//
//  Created by Zachary Shakked on 2/16/16.
//  Copyright © 2016 Zachary Shakked. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    @discardableResult
    public func present(on controller: UIViewController, animated: Bool = true, completion: (() -> ())? = nil) -> UIViewController {
        controller.present(self, animated: animated, completion: completion)
        
        return self
    }

    public func dismiss(_ completion: (() -> ())? = nil ) {
        self.dismiss(animated: true, completion: completion)
    }
    
    public func inNavigationController() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
