//
//  RegistrationView.swift
//  ThreadsApp
//
//  Created by Thành Trung on 1/9/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) private var dismiss
    var body: some View {
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
                TextField("Enter your full name", text: $viewModel.fullName)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your user name", text: $viewModel.userName)
                    .textInputAutocapitalization(.never)
                    .modifier(ThreadsTextFieldModifier())
            }
            
            Button {
                Task{ try await viewModel.createUser() }
            } label: {
                Text("Sign up")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.white))
                    .frame(width: 352, height: 44)
                    .background(Color(.black))
                    .clipShape(Capsule())
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3 ) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundStyle(Color(.black))
            }
            .padding(.vertical, 16)
        }
    }
}

#Preview {
    RegistrationView()
}
