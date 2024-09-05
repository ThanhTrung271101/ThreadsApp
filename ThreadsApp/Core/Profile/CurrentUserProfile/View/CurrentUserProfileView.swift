//
//  CurrentUserProfileView.swift
//  ThreadsApp
//
//  Created by Thành Trung on 5/9/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    private var currentUser: User? {
        return viewModel.currentUser
    }
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 20) {
                    ProfileHeaderView(user: currentUser)
                    
                    Button {
                        
                    } label: {
                        Text("Follow")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.white))
                            .frame(width: 352, height: 32)
                            .background(Color(.black))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    
                    UserContentListView()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
