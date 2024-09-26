//
//  ThreadCell.swift
//  ThreadsApp
//
//  Created by Thành Trung on 2/9/24.
//

import SwiftUI

struct ThreadCell: View {
    let thread: Thread
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                CircularProfileImageView(user: thread.user, size: .small)
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(thread.user?.userName ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)

                        Spacer()

                        Text(thread.timestamp.timestampString())
                            .font(.footnote)
                            .foregroundStyle(Color(.systemGray3))

                        Button {

                        } label: {
                            Image(systemName: "ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }

                    }

                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)

                    HStack(spacing: 16) {
                        Button {

                        } label: {
                            Image(systemName: "heart")
                        }

                        Button {

                        } label: {
                            Image(systemName: "bubble.right")
                        }

                        Button {

                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }

                        Button {

                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .tint(.black)
                    .padding(.vertical, 8)
                }
            }
            Divider()
        }
        .padding()
    }
}

#Preview {
    ThreadCell(thread: DeveloperPreview.shared.thread)
}
