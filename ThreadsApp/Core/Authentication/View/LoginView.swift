//
//  LoginView.swift
//  ThreadsApp
//
//  Created by Thành Trung on 1/9/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack {
            VStack {

                Spacer()

                Image("threads-app-icon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .padding()

                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .modifier(ThreadsTextFieldModifier())
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifier())
                }

                NavigationLink {
                    Text("Forgot password?")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundStyle(Color(.black))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }

                Button {
                    Task {
                        try await viewModel.login()
                    }
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.white))
                        .frame(width: 352, height: 44)
                        .background(Color(.black))
                        .clipShape(Capsule())
                }

                Spacer()

                Divider()

                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3 ) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundStyle(Color(.black))
                }
                .padding(.vertical, 14)

            }
        }
    }
}

#Preview {
    LoginView()
}
