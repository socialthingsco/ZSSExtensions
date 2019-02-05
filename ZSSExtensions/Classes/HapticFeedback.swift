//
//  HapticFeedback.swift
//  Command
//
//  Created by Zachary Shakked on 12/28/16.
//  Copyright © 2016 Shakd, LLC. All rights reserved.
//

import UIKit

public final class HapticFeedback {
    public static let shared: HapticFeedback = HapticFeedback()
    
    public let selection: UISelectionFeedbackGenerator
    public let impact: UIImpactFeedbackGenerator
    public let notification: UINotificationFeedbackGenerator
    
    
    init() {
        selection = UISelectionFeedbackGenerator()
        selection.prepare()
        
        impact = UIImpactFeedbackGenerator()
        impact.prepare()
        
        notification = UINotificationFeedbackGenerator()
        notification.prepare()
    }
}

