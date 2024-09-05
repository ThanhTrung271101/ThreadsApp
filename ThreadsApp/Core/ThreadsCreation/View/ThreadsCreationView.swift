//
//  ThreadsCreationView.swift
//  ThreadsApp
//
//  Created by Thành Trung on 1/9/24.
//

import SwiftUI

struct ThreadsCreationView: View {
    @StateObject var viewModel = ThreadCreationViewModel()
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    CircularProfileImageView(user: user, size: .small)
                    
                    VStack(alignment: .leading) {
                        Text(user?.userName ?? "")
                            .fontWeight(.semibold)
                        TextField("Start a thread ...", text: $caption, axis: .vertical)
                    }
                    .font(.footnote)
                    
                    if !caption.isEmpty {
                        Button {
                            caption = ""
                        } label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(Color(.systemGray))
                        }
                    }
                }
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("New Thread")
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
                            try await viewModel.uploadThread(caption: caption)
                            dismiss()
                        }
                    } label: {
                        Text("Post")
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color(.black))
                }
            }
        }
    }
}

#Preview {
    ThreadsCreationView()
}
