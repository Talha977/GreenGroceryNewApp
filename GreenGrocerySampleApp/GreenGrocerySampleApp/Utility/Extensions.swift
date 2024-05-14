//
//  Extensions.swift
//  GreenGrocerySampleApp
//
//  Created by Talha Asif on 15/05/2024.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
        let emailRegex = #"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"#
        let emailPredicate = NSPredicate(format:"SELF MATCHES[c] %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    func isValidPassword() -> Bool {
        return !self.isEmpty && self.count > 6
    }
}
