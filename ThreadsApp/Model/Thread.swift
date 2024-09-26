//
//  Thread.swift
//  ThreadsApp
//
//  Created by Thành Trung on 5/9/24.
//

import Firebase
import FirebaseFirestore

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?

    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int

    var id: String {
        return threadId ?? NSUUID().uuidString
    }

    var user: User?

}
