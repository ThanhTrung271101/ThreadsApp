//
//  ExploreViewModel.swift
//  ThreadsApp
//
//  Created by Thành Trung on 5/9/24.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()

    init() {
        Task {
            try await fetchUsers()
        }
    }

    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
