//
//  PreviewProvider.swift
//  ThreadsApp
//
//  Created by Thành Trung on 5/9/24.
//

import SwiftUI

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullName: "Bruce Wayne", userName: "batman", email: "batman@gmail.com", profileImageUrl: "danielroberts", bio: "")
}
