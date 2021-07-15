//
//  NotificationCell.swift
//  InstagramSwiftUI
//
//  Created by Gustas on 2021-07-14.
//

import SwiftUI

struct NotificationCell: View {
    @State private var showPostImage = false
    var body: some View {

        HStack {
            Image("portrait")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            Text("Batman").font(.system(size: 14, weight: .semibold)) + Text(" ") + Text("liked one of your posts.").font(.system(size: 15))
            
            Spacer()
            
            if showPostImage {
                Image("portrait")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
            } else {
                Button(action: {}, label: {
                    Text("Follow")
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .font(.system(size: 14, weight: .semibold))
                })
            }
        }.padding(.horizontal)
    }
}

struct NotificationCell_Previews: PreviewProvider {
    static var previews: some View {
        NotificationCell()
    }
}
