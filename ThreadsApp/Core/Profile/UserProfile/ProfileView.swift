//
//  ProfileView.swift
//  ThreadsApp
//
//  Created by Thành Trung on 1/9/24.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 20) {
                    ProfileHeaderView(user: user)
                    
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.black))
                            .frame(width: 352, height: 32)
                            .background(Color(.white))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    }
                    
                    UserContentListView()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal)
    }
}

#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}
