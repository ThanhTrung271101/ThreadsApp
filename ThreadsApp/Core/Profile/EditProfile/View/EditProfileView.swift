//
//  EditProfileView.swift
//  ThreadsApp
//
//  Created by Thành Trung on 2/9/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user: User
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea(edges: [.bottom, .horizontal])

                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text(user.fullName)
                        }

                        Spacer()

                        PhotosPicker(selection: $viewModel.seletedItem) {
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 44, height: 44)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }
                    }

                    Divider()

                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter your bio ...", text: $bio, axis: .vertical)
                    }

                    Divider()

                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add link ...", text: $link)
                    }

                    Divider()

                    Toggle("Private profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(Color(.white))
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()

            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Cancel")
                    }
                    .font(.subheadline)
                    .foregroundStyle(Color(.black))
                }

                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    } label: {
                        Text("Done")
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.black))
                }
            }
        }
    }
}

#Preview {
    EditProfileView(user: DeveloperPreview.shared.user)
}
