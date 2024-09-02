//
//  CircularProfileImageView.swift
//  ThreadsApp
//
//  Created by Thành Trung on 2/9/24.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("annaclark")
            .resizable()
            .scaledToFill()
            .frame(width: 44, height: 44)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
