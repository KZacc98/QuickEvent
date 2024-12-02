//
//  Date+Extension.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 02/12/2024.
//

import Foundation

extension Date {
    func timeAndDateAsString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm, dd.MM.yyyy"
        
        return dateFormatter.string(from: self)
    }
    

    func dateAsString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        
        return dateFormatter.string(from: self)
    }
}
