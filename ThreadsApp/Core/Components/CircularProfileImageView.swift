//
//  CircularProfileImageView.swift
//  ThreadsApp
//
//  Created by Thành Trung on 2/9/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        Image("annaclark")
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView(width: 44, height: 44)
}
