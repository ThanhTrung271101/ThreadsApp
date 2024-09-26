//
//  RegistrationViewModel.swift
//  ThreadsApp
//
//  Created by Thành Trung on 4/9/24.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var userName = ""
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullName: fullName,
            userName: userName
        )
    }
}
