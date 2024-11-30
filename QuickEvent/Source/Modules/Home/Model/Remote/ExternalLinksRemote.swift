//
//  ExternalLinksRemote.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 30/11/2024.
//

import Foundation

struct ExternalLinksRemote: Codable {
    let youtube: [String]?
    let twitter: [String]?
    let facebook: [String]?
    let wiki: [String]?
    let instagram: [String]?
    let homepage: [String]?
    let itunes: [String]?
    let lastfm: [String]?
    let spotify: [String]?
    
    enum CodingKeys: String, CodingKey {
        case youtube, twitter, facebook, wiki, instagram, homepage, itunes, lastfm, spotify
    }
    
    enum LinksContainerCodingKeys: String, CodingKey {
        case url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let youtubeContainer = try? container.decodeIfPresent([[String: String]].self, forKey: .youtube) {
            youtube = youtubeContainer.compactMap { $0["url"] }
        } else {
            youtube = nil
        }
        
        if let twitterContainer = try? container.decodeIfPresent([[String: String]].self, forKey: .twitter) {
            twitter = twitterContainer.compactMap { $0["url"] }
        } else {
            twitter = nil
        }
        
        if let facebookContainer = try? container.decodeIfPresent([[String: String]].self, forKey: .facebook) {
            facebook = facebookContainer.compactMap { $0["url"] }
        } else {
            facebook = nil
        }
        
        if let wikiContainer = try? container.decodeIfPresent([[String: String]].self, forKey: .wiki) {
            wiki = wikiContainer.compactMap { $0["url"] }
        } else {
            wiki = nil
        }
        
        if let instagramContainer = try? container.decodeIfPresent([[String: String]].self, forKey: .instagram) {
            instagram = instagramContainer.compactMap { $0["url"] }
        } else {
            instagram = nil
        }
        
        if let homepageContainer = try? container.decodeIfPresent([[String: String]].self, forKey: .homepage) {
            homepage = homepageContainer.compactMap { $0["url"] }
        } else {
            homepage = nil
        }
        
        if let itunesContainer = try? container.decodeIfPresent([[String: String]].self, forKey: .itunes) {
            itunes = itunesContainer.compactMap { $0["url"] }
        } else {
            itunes = nil
        }
        
        if let lastfmContainer = try? container.decodeIfPresent([[String: String]].self, forKey: .lastfm) {
            lastfm = lastfmContainer.compactMap { $0["url"] }
        } else {
            lastfm = nil
        }
        
        if let spotifyContainer = try? container.decodeIfPresent([[String: String]].self, forKey: .spotify) {
            spotify = spotifyContainer.compactMap { $0["url"] }
        } else {
            spotify = nil
        }
    }
    
    func toDomain() -> ExternalLinksDomain {
        return ExternalLinksDomain(
            youtube: youtube?.compactMap { URL(optionalString: $0) } ?? [],
            twitter: twitter?.compactMap { URL(optionalString: $0) } ?? [],
            facebook: facebook?.compactMap { URL(optionalString: $0) } ?? [],
            wiki: wiki?.compactMap { URL(optionalString: $0) } ?? [],
            instagram: instagram?.compactMap { URL(optionalString: $0) } ?? [],
            homepage: homepage?.compactMap { URL(optionalString: $0) } ?? [],
            itunes: itunes?.compactMap { URL(optionalString: $0) } ?? [],
            lastfm: lastfm?.compactMap { URL(optionalString: $0) } ?? [],
            spotify: spotify?.compactMap { URL(optionalString: $0) } ?? []
        )
    }
}
