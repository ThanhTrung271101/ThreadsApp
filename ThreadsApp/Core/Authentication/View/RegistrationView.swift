//
//  RegistrationView.swift
//  ThreadsApp
//
//  Created by Thành Trung on 1/9/24.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
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
                TextField("Enter your email", text: $email)
                    .textInputAutocapitalization(.never)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your password", text: $password)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your full name", text: $fullname)
                    .modifier(ThreadsTextFieldModifier())
                TextField("Enter your user name", text: $username)
                    .modifier(ThreadsTextFieldModifier())
            }
            
            Button {
                
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
