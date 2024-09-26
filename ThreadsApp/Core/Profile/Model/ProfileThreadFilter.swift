//
//  ProfileThreadFilter.swift
//  ThreadsApp
//
//  Created by Thành Trung on 2/9/24.
//

import Foundation

enum ProfileThreadFilter: Int, Identifiable, CaseIterable {
    case threads
    case replies

    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }

    var id: Int {
        return self.rawValue
    }
}
