//
//  ContentViewModel.swift
//  ThreadsApp
//
//  Created by Thành Trung on 4/9/24.
//

import Foundation
import Combine
import FirebaseAuth

class ContentViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupSubscriber()
    }

    private func setupSubscriber() {
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
