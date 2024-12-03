//
//  Double+Extension.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 02/12/2024.
//

import Foundation

extension Double {
    func toCurrencyString(currencyCode: String?) -> String? {
        
        guard let currencyCode else {
            return "\(self.description)"
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode

        return formatter.string(from: NSNumber(value: self))
    }
}
