//
//  ThreadService.swift
//  ThreadsApp
//
//  Created by Thành Trung on 5/9/24.
//

import Foundation
import Firebase
import FirebaseFirestore

struct ThreadService {
    static func uploadThread(_ thread: Thread) async throws {
        guard let threadData = try? Firestore.Encoder().encode(thread) else { return }
        try await Firestore.firestore().collection("threads").addDocument(data: threadData)
    }
}
