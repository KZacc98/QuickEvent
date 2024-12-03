//
//  DetailsAttractionInfo.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 02/12/2024.
//

import SwiftUI

struct DetailsAttractionInfo: View {
    private var attraction: AttractionDomain
    
    init(attraction: AttractionDomain) {
        self.attraction = attraction
    }
    
    var body: some View {
        BaseCardView(infoImage: Image(systemName: "star.fill"), infoText: "") {
            if let imageUrl = attraction.bestThreeByTwoImage?.url {
                AsyncImage(url: imageUrl) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 320, height: 180)
                        .cornerRadius(15)
                } placeholder: {
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.5))
                            .frame(width: 320, height: 180)
                            .cornerRadius(15)
                        ProgressView()
                    }
                }
            }
            
            if let attractioName = attraction.name {
                Text(attractioName)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .minimumScaleFactor(0.5)
                    .lineLimit(3)
                    .foregroundStyle(Color.babyPowder)
                    .frame(minWidth: 320, maxWidth: 320, minHeight: 20, maxHeight: 75, alignment: .center)
            }
            
            if let attractionDescription = attraction.classifications.first?.description {
                Text(attractionDescription)
                    .font(.title3)
                    .fontWeight(.medium)
                    .minimumScaleFactor(0.5)
                    .lineLimit(3)
                    .foregroundStyle(Color.babyPowder)
                    .frame(minWidth: 320, maxWidth: 320, minHeight: 20, maxHeight: 50, alignment: .center)
                    .padding(.bottom, 10)
            }
            
            if let links = attraction.externalLinks {
                ExternalLinksView(links: links)
            }
        }
    }
}

#Preview {
    let main = AttractionDomain(
        id: "K8vZ917GSz7",
        name: "Imagine Dragons",
        type: "attraction",
        url: URL(string: "https://www.ticketmaster.no/artist/imagine-dragons-billetter/389123"),
        externalLinks: ExternalLinksDomain(
            youtube: [URL(string: "https://www.youtube.com/user/ImagineDragonsVEVO")!],
            twitter: [URL(string: "https://twitter.com/Imaginedragons")!],
            facebook: [URL(string: "https://www.facebook.com/ImagineDragons")!],
            wiki: [URL(string: "https://en.wikipedia.org/wiki/Imagine_Dragons")!],
            instagram: [URL(string: "http://instagram.com/imaginedragons/"), URL(string: "http://instagram.com/imaginedragons")].compactMap { $0 },
            homepage: [URL(string: "http://www.imaginedragonsmusic.com/")!],
            itunes: [],
            lastfm: [URL(string: "http://www.last.fm/music/Imagine+Dragons")!],
            spotify: []
        ),
        images: [
            EventImageDomain(
                ratio: .threeByTwo,
                url: URL(string: "https://s1.ticketm.net/dam/a/e8c/5265b9d2-a06c-4dc8-a432-a8dd9d042e8c_ARTIST_PAGE_3_2.jpg"),
                width: 305,
                height: 203,
                fallback: false
            ),
            EventImageDomain(
                ratio: .sixteenByNine,
                url: URL(string: "https://s1.ticketm.net/dam/a/e8c/5265b9d2-a06c-4dc8-a432-a8dd9d042e8c_SOURCE"),
                width: 2426,
                height: 1365,
                fallback: false
            )
        ],
        classifications: [
            ClassificationDomain(
                primary: true,
                segment: "Music",
                genre: "Rock",
                subGenre: "Pop",
                family: false
            )
        ]
    )
    let support = AttractionDomain(
        id: "K8vZ917f1KV",
        name: "Declan McKenna",
        type: "attraction",
        url: URL(string: "https://www.ticketmaster.pl/artist/declan-mckenna-bilety/966837"),
        externalLinks: ExternalLinksDomain(
            youtube: [URL(string: "https://www.youtube.com/user/DeclanMckennaMusic")!],
            twitter: [URL(string: "https://twitter.com/declanmckenna")!],
            facebook: [URL(string: "https://www.facebook.com/DeclanMckennaMusic")!],
            wiki: [],
            instagram: [URL(string: "https://www.instagram.com/thedeclanmckenna/")!],
            homepage: [URL(string: "http://www.declanmckenna.net/")!],
            itunes: [URL(string: "https://music.apple.com/us/artist/declan-mckenna/1009282890")!],
            lastfm: [],
            spotify: [URL(string: "https://open.spotify.com/artist/2D4FOOOtWycb3Aw9nY5n3c")!]
        ),
        images: [
            EventImageDomain(
                ratio: .unknown,
                url: URL(string: "https://s1.ticketm.net/dam/a/a0b/9e4d6341-4102-4542-874d-d8544cbe9a0b_SOURCE"),
                width: 4000,
                height: 4000,
                fallback: false
            ),
            EventImageDomain(
                ratio: .sixteenByNine,
                url: URL(string: "https://s1.ticketm.net/dam/a/a0b/9e4d6341-4102-4542-874d-d8544cbe9a0b_RECOMENDATION_16_9.jpg"),
                width: 100,
                height: 56,
                fallback: false
            )
        ],
        classifications: [
            ClassificationDomain(
                primary: true,
                segment: "Music",
                genre: "Rock",
                subGenre: "Pop",
                family: false
            )
        ]
    )
    
    VStack {
        DetailsAttractionInfo(attraction: main)
        DetailsAttractionInfo(attraction: support)
    }
}
