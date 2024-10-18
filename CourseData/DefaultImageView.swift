//
//  DefaultImageView.swift
//  CourseData
//
//  Created by 平松蒼惟 on 2024/10/18.
//

import SwiftUI

struct DefaultImageView: View {
    var body: some View {
        VStack{
            ProgressView()
                .padding()
            Image(systemName: "books.vertical")
                .font(.largeTitle)
                .padding(.bottom, 3)
            Text("Grabbing the image...")
                .foregroundStyle(.secondary)
        }
        .padding(.vertical, 50)
        .frame(maxWidth: .infinity)
        .background{
            Color.gray
                .opacity(0.5)
        }
    }
}

#Preview {
    DefaultImageView()
}
