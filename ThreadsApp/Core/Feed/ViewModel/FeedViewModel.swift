//
//  FeedViewModel.swift
//  ThreadsApp
//
//  Created by Thành Trung on 6/9/24.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject {
    @Published var threads = [Thread]()

    init() {
        Task {
            try await fetchThreads()
        }
    }

    @MainActor
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThreads()
    }

    private func fetchUserDataForThreads() async throws {
        for i in 0 ..< threads.count {
            let thread = threads[i]
            let ownerUid = thread.ownerUid

            let threadUser = try await UserService.fetchUser(withUid: ownerUid)

            threads[i].user = threadUser
        }
    }
}
