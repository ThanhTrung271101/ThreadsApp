//
//  UserContentListView.swift
//  ThreadsApp
//
//  Created by Thành Trung on 5/9/24.
//

import SwiftUI

struct UserContentListView: View {
    @StateObject var viewModel: UserContentListViewModel
    @State private var seletedFilter: ProfileThreadFilter = .threads

    @Namespace var animation

    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }

    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
    }
    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadFilter.allCases) { filter in
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
                ForEach(viewModel.threads) { thread in
                    ThreadCell(thread: thread)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    UserContentListView(user: DeveloperPreview.shared.user)
}
