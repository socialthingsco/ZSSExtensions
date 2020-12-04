//
//  FormValidation.swift
//  ZSSExtensions
//
//  Created by Ethan.L on 11/21/20.
//  Copyright © 2016 Zachary Shakked. All rights reserved.
//

import Foundation

public struct FormValidation {

    static public func isRequiredString (_ value: Any?) -> String? {
        if let string = value as? String {
            if string == "" {
                return "This field is required."
            }
        }
        return nil
    }

    static public func isProbablyAnEmail (_ value: Any?) -> String? {
        if let string = value as? String, string != "" {
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            if !emailTest.evaluate(with: string) {
                return "Invalid email"
            }
        }
        return nil
    }

    static public func isProbablyAnGmail (_ value: Any?) -> String? {
        if let string = value as? String, string != "" {
            let emailRegEx = "^[a-zA-Z][-_.a-zA-Z0-9]{5,29}@g(oogle)?mail.com$"
            let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            if !emailTest.evaluate(with: string) {
                return "Invalid email"
            }
        }
        return nil
    }

    static func minimumLength (length: Int) -> FormFieldValidation {
        return { value in
            if let string = value as? String,
                string.count < length {
                return "\(length) character minimum"
            }
            return nil
        }
    }
}
