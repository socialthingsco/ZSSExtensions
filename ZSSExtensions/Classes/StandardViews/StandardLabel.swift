//
//  StandardLabel.swift
//  Command
//
//  Created by Zachary Shakked on 6/26/18.
//  Copyright © 2018 Zachary Shakked. All rights reserved.
//

import UIKit

public class StandardLabel: UILabel {
    
    @IBInspectable public var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public override var shadowColor: UIColor? {
        didSet {
            layer.shadowColor = shadowColor?.cgColor
        }
    }
    
    @IBInspectable public var shadowRadius: CGFloat = 0.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable public var shadowOpacity: Float = 0.0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
}
