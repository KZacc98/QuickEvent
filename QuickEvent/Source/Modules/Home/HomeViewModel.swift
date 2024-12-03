//
//  HomeViewModel.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @EnvironmentObject var coordinator: Coordinator
    @Published var events: [EventDomain] = []
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    private let eventsService: EventsService?
    private var currentPage = 0
    private var pageSize = 20
    private var hasMoreData = true

    init(eventsService: EventsService?, events: [EventDomain] = []) {
        self.eventsService = eventsService
        self.events = events
    }

    func getEvents(dateAsc: Bool = false, dateDesc: Bool = false) {
        guard !isLoading && hasMoreData else { return }
        isLoading = true
        
        eventsService?.getEvents(page: currentPage, pageSize: pageSize, dateAsc: dateAsc, dateDesc: dateDesc)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = String(format: "failedToFetchEvents".localized, error.localizedDescription)
                    self?.hasMoreData = false
                }
            }, receiveValue: { [weak self] response in
                if response.isEmpty {
                    self?.hasMoreData = false
                } else {
                    self?.events.append(contentsOf: response)
                    self?.currentPage += 1
                }
            })
            .store(in: &cancellables)
    }
    
    func shouldLoadMoreEvents(currentItem: EventDomain) -> Bool {
        guard let lastEvent = events.last else {
            return false
        }
        
        return currentItem.id == lastEvent.id && hasMoreData && !isLoading
    }
    
    func refreshEvents(eventDateOrder: FilterType) {
        withAnimation(.snappy(duration: 1)) {
            events = []
            currentPage = 0
            hasMoreData = true
            errorMessage = nil
            
            getEvents(dateAsc: eventDateOrder == .ascending, dateDesc: eventDateOrder == .descending)
        }
    }
    
    func getEvent(by id: String) async -> EventDomain? {
        isLoading = true
        defer { isLoading = false }
        
        do {
            let fetchedEvent = try await eventsService?.getEventDetails(eventId: id)
            return fetchedEvent
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = String(format: "failedToFetchEventDetails".localized, error.localizedDescription)
            }
            
            return nil
        }
    }
}

