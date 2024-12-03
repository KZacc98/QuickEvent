//
//  String+Extension.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

import Foundation

extension String {
    func toDate(withFormat format: String = "yyyy-MM-dd") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        return dateFormatter.date(from: self)
    }
    
    func toDateTime(withFormat format: String = "yyyy-MM-dd'T'HH:mm:ssZ") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        
        return dateFormatter.date(from: self)
    }
    
    func capitalizeFirstLetter() -> String {
        guard !self.isEmpty else { return self }
        
        return self.prefix(1).capitalized + self.dropFirst()
    }
}
