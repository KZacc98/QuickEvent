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
    private let apiKey = ""
    private let baseURL = "https://app.ticketmaster.com/discovery/v2/events.json"
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getEvents(page: Int, pageSize: Int) -> AnyPublisher<[EventDomain], Error> {
        let urlString = "\(baseURL)?countryCode=PL&page=\(page)&size=\(pageSize)&sort=date,asc&apikey=\(apiKey)"
        guard let url = URL(string: urlString) else {
            return Fail(error: NetworkError.badRequest(statusCode: 400)).eraseToAnyPublisher()
        }
        return networkManager.fetch(url: url)
            .map { (response: TMResponseRemote) in
                response.embedded.events.map { $0.toDomain() }
            }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
