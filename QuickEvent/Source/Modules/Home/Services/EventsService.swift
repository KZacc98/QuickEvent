//
//  EventsService.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//

import Foundation
import Combine

class EventsService {
    private let networkManager: NetworkManager
#error("Provide your own API Key here, and comment that error")
    private let apiKey = ""
    private let baseURL = "https://app.ticketmaster.com/discovery/v2/events"
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getEvents(page: Int, pageSize: Int, dateAsc: Bool = false, dateDesc: Bool = false) -> AnyPublisher<[EventDomain], Error> {
        var urlString = "\(baseURL)?countryCode=PL&page=\(page)&size=\(pageSize)&apikey=\(apiKey)"
        
        if dateAsc {
            urlString.append("&sort=date,asc")
        }
        
        if dateDesc {
            urlString.append("&sort=date,desc")
        }
        
        guard let url = URL(string: urlString) else {
            return Fail(error: NetworkError.badRequest(statusCode: 400)).eraseToAnyPublisher()
        }
        
        return networkManager.fetch(from: url)
            .decode(type: TMResponseRemote.self, decoder: JSONDecoder())
            .map { response in
                response.embedded.events.map { $0.toDomain() }
            }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
    
    func getEventDetails(eventId: String) async throws -> EventDomain {
        let urlString = "\(baseURL)/\(eventId)?apikey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL, userInfo: [NSLocalizedDescriptionKey: "badURL".localized])
        }
        
        let result = await networkManager.fetch(from: url)
        
        switch result {
        case .success(let data):
            let eventRemote = try JSONDecoder().decode(EventRemote.self, from: data)
            
            return eventRemote.toDomain()
        case .failure(let error):
            throw error
        }
    }
}
