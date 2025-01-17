//
//  ClassificationDomain.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

struct ClassificationDomain {
    let primary: Bool
    let segment: String?
    let genre: String?
    let subGenre: String?
    let family: Bool
    
    var description: String {
        let components = [genre, subGenre]
        
        return components.compactMap { $0 }.joined(separator: ", ")
    }
}
