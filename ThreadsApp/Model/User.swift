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
    var profileImageUrl: String?
    let bio: String?
}
