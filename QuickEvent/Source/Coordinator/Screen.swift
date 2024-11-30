//
//  Screen.swift
//  QuickEvent
//
//  Created by Kamil Zachara on 27/11/2024.
//

enum Screen: Hashable {
    case home
    case details(viewModel: DetailsViewModel)
    
    static func == (lhs: Screen, rhs: Screen) -> Bool {
        switch (lhs, rhs) {
        case (.home, .home):
            return true
        case (.details(let lhsViewModel), .details(let rhsViewModel)):
            return lhsViewModel.event.id == rhsViewModel.event.id
        default:
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .home:
            hasher.combine("home")
        case .details(let viewModel):
            hasher.combine(viewModel.id)
        }
    }
}
