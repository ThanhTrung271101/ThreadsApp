//
//  ProfileView.swift
//  ThreadsApp
//
//  Created by Thành Trung on 1/9/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    @State private var seletedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 20) {
                    HStack(alignment: .top) {
                        
                        VStack(alignment: .leading, spacing: 12) {
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text("Charles Leclerc")
                                    .font(.title2)
                                    .fontWeight(.semibold)
                                Text("charles_leclerc")
                                    .font(.subheadline)
                            }
                            Text("Formula 1 Driver for Scuderia Ferrari")
                                .font(.footnote)
                                .padding(.vertical, 6)
                            Text("2 followers")
                                .font(.caption)
                                .foregroundStyle(Color(.systemGray2))
                        }
                        
                        Spacer()
                        
                        CircularProfileImageView(width: 56, height: 56)
                    }
                    
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
                    
                    VStack {
                        HStack {
                            ForEach(ProfileThreadFilter.allCases) {
                                filter in
                                VStack {
                                    Text(filter.title)
                                        .font(.subheadline)
                                        .fontWeight(seletedFilter == filter ? .semibold : .regular)
                                    if seletedFilter == filter {
                                        Rectangle()
                                            .foregroundStyle(Color(.black))
                                            .frame(width: filterBarWidth, height: 1)
                                            .matchedGeometryEffect(id: "item", in: animation)
                                    } else {
                                        Rectangle()
                                            .foregroundStyle(Color(.clear))
                                            .frame(width: filterBarWidth, height: 1)
                                    }
                                }
                                .onTapGesture {
                                    withAnimation(.spring) {
                                        seletedFilter = filter
                                    }
                                }
                            }
                        }
                        LazyVStack {
                            ForEach(0 ... 20, id: \.self) { thread in
                                ThreadCell()
                            }
                        }
                    }
                    .padding(.vertical, 8)
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
    ProfileView()
}
