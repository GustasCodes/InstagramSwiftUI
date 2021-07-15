//
//  ProfileHeaderView.swift
//  InstagramSwiftUI
//
//  Created by Gustas on 2021-07-14.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("portrait")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)
                
                Spacer()
                
                HStack(spacing: 16) {
                    UserStatView(value: 1, title: "Post")
                    UserStatView(value: 2, title: "Followers")
                    UserStatView(value: 4, title: "Following")
                }.padding(.trailing, 32)
            }
            
            Text("Bruce wayne")
                .font(.system(size: 15, weight: .semibold))
                .padding([.leading, .top])
            
            Text("Gotham's Dark Knight")
                .font(.system(size: 15, weight: .semibold))
                .padding(.leading)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                
                ProfileActionButtonView()
                
                Spacer()
            }.padding(.top)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
    }
}
