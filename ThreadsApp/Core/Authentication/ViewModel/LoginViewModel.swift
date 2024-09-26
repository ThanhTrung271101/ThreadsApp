//
//  LoginViewModel.swift
//  ThreadsApp
//
//  Created by Thành Trung on 4/9/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
