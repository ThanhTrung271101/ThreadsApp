//
//  ThreadCreationViewModel.swift
//  ThreadsApp
//
//  Created by Thành Trung on 5/9/24.
//

import Foundation
import Firebase
import FirebaseAuth

class ThreadCreationViewModel: ObservableObject {
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
