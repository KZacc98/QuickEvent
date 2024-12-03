//
//  ExternalLinksView.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 02/12/2024.
//

import SwiftUI

struct ExternalLinksView: View {
    let links: ExternalLinksDomain
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                if !links.itunes.isEmpty {
                    Link(destination: links.itunes[0]) {
                        Image("Itunes")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color("BabyPowder"))
                    }
                }
                
                if !links.spotify.isEmpty {
                    Link(destination: links.spotify[0]) {
                        Image("Spotify")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color("BabyPowder"))
                    }
                }
                
                if !links.youtube.isEmpty {
                    Link(destination: links.youtube[0]) {
                        Image("Youtube")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color("BabyPowder"))
                    }
                }
                
                if !links.twitter.isEmpty {
                    Link(destination: links.twitter[0]) {
                        Image("Twitter")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color("BabyPowder"))
                    }
                }
                
                if !links.facebook.isEmpty {
                    Link(destination: links.facebook[0]) {
                        Image("Facebook")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color("BabyPowder"))
                    }
                }
                
                if !links.wiki.isEmpty {
                    Link(destination: links.wiki[0]) {
                        Image("Wiki")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color("BabyPowder"))
                    }
                }
                
                if !links.instagram.isEmpty {
                    Link(destination: links.instagram[0]) {
                        Image("Instagram")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color("BabyPowder"))
                    }
                }
                
                if !links.homepage.isEmpty {
                    Link(destination: links.homepage[0]) {
                        Image("Homepage")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color("BabyPowder"))
                    }
                }
                
                if !links.lastfm.isEmpty {
                    Link(destination: links.lastfm[0]) {
                        Image("LastFM")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(Color("BabyPowder"))
                    }
                }
            }
            .padding(10)
        }
    }
}

// Preview
struct ExternalLinksView_Previews: PreviewProvider {
    static var previews: some View {
        let exampleLinks = ExternalLinksDomain(
            youtube: [URL(string: "https://youtube.com")!],
            twitter: [URL(string: "https://twitter.com")!],
            facebook: [URL(string: "https://facebook.com")!],
            wiki: [URL(string: "https://facebook.com")!],
            instagram: [URL(string: "https://instagram.com")!],
            homepage: [URL(string: "https://example.com")!],
            itunes: [URL(string: "https://facebook.com")!],
            lastfm: [URL(string: "https://last.fm")!],
            spotify: [URL(string: "https://spotify.com")!]
        )
        ExternalLinksView(links: exampleLinks)
            .background(Color("LapisBlue"))
    }
}
