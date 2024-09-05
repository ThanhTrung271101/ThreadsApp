//
//  User.swift
//  ThreadsApp
//
//  Created by Thành Trung on 4/9/24.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullName: String
    let userName: String
    let email: String
    let profileImageUrl: String?
    let bio: String?
}
