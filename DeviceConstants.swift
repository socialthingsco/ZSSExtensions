//
//  DeviceConstants.swift
//
//
//  Copyright © 2019 Zachary Shakked. All rights reserved.
//

import Foundation

public struct DeviceConstants {
    
    public let small: CGFloat
    public let medium: CGFloat
    public let large: CGFloat
    
    public init(small: CGFloat, medium: CGFloat, large: CGFloat) {
        self.small = small
        self.medium = medium
        self.large = large
    }
    
    
    
    public var forCurrentDevice: CGFloat {
        switch UIDevice.current.screenType {
        case .iPhone_XR, .iPhone_XSMax, .iPhones_X_XS, .iPhones_6Plus_6sPlus_7Plus_8Plus:
            return large
        case .iPhones_6_6s_7_8:
            return medium
        case .iPhones_5_5s_5c_SE, .iPhones_4_4S:
            return small
        default:
            return large
        }
    }
    
    
    public enum Size {
        case small, medium, large
    }
    
    public static var currentSize: Size {
        switch UIDevice.current.screenType {
        case .iPhone_XR, .iPhone_XSMax, .iPhones_X_XS, .iPhones_6Plus_6sPlus_7Plus_8Plus:
            return Size.large
        case .iPhones_6_6s_7_8:
            return Size.medium
        case .iPhones_5_5s_5c_SE, .iPhones_4_4S:
            return Size.small
        default:
            return Size.large
        }
    }
}
