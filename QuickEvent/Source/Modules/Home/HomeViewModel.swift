//
//  HomeViewModel.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 29/11/2024.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    @Published var events: [Event] = []
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let eventsService: EventsService?
    private var currentPage = 0
    private var pageSize = 20
    private var isLoading = false
    private var hasMoreData = true


    init(eventsService: EventsService?, events: [Event] = []) {
        self.eventsService = eventsService
        self.events = events
    }

    func getEvents() {
        guard !isLoading && hasMoreData else { return }
        isLoading = true
        
        eventsService?.getEvents(page: currentPage, pageSize: pageSize)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = "Failed to fetch events: \(error.localizedDescription)"
                    self?.hasMoreData = false
                }
            }, receiveValue: { [weak self] response in
                if response.embedded.events.isEmpty {
                    self?.hasMoreData = false
                } else {
                    self?.events.append(contentsOf: response.embedded.events)
                    self?.currentPage += 1
                }
            })
            .store(in: &cancellables)
    }
}

