//
//  ClassificationRemote.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

struct ClassificationRemote: Codable {
    let primary: Bool?
    let segment: String?
    let genre: String?
    let subGenre: String?
    let family: Bool?
    
    enum CodingKeys: String, CodingKey {
        case primary, segment, genre, subGenre, family
    }
    
    enum GenreCodingKeys: String, CodingKey {
        case name
    }
    
    enum SegmentCodingKeys: String, CodingKey {
        case name
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.primary = try container.decodeIfPresent(Bool.self, forKey: .primary)
        
        if let segmentContainer = try? container.nestedContainer(keyedBy: SegmentCodingKeys.self, forKey: .segment) {
            self.segment = try segmentContainer.decodeIfPresent(String.self, forKey: .name)
        } else {
            self.segment = nil
        }
        
        if let genreContainer = try? container.nestedContainer(keyedBy: GenreCodingKeys.self, forKey: .genre) {
            self.genre = try genreContainer.decodeIfPresent(String.self, forKey: .name)
        } else {
            self.genre = nil
        }
        
        if let subGenreContainer = try? container.nestedContainer(keyedBy: GenreCodingKeys.self, forKey: .subGenre) {
            self.subGenre = try subGenreContainer.decodeIfPresent(String.self, forKey: .name)
        } else {
            self.subGenre = nil
        }
        
        self.family = try container.decodeIfPresent(Bool.self, forKey: .family)
    }
    
    func toDomain() -> ClassificationDomain {
        return ClassificationDomain(
            primary: primary ?? false,
            segment: segment,
            genre: genre,
            subGenre: subGenre,
            family: family ?? false
        )
    }
}
