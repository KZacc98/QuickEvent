//
//  URL+Extension.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

import Foundation

extension URL {
    init?(optionalString: String?) {
        guard let urlString = optionalString, let url = URL(string: urlString) else {
            return nil
        }
        
        self = url
    }
}
