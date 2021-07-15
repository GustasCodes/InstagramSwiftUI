//
//  FeedCell.swift
//  InstagramSwiftUI
//
//  Created by Gustas on 2021-07-02.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("portrait")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 26, height: 26)
                    .clipped()
                    .cornerRadius(18)
                
                Text("joker")
                    .font(.system(size: 14, weight: .semibold))
            }
            .padding([.leading, .bottom], 8)
            
            Image("portrait")
                .resizable()
                .scaledToFill()
                .frame(maxHeight: 440)
                .clipped()
            
            HStack(spacing: 16) {
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "heart")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .clipped()
                        .padding(4)
                })
                
                Button(action: {}, label: {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .clipped()
                        .padding(4)
                })
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "paperplane")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .clipped()
                        .padding(4)
                })
            }
            .padding(.leading, 4)
            .foregroundColor(.black)
            
            Text("3 likes")
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text("Batman").font(.system(size: 14, weight: .semibold)) + Text(" ") + Text("All man have limits. They learn what they are..").font(.system(size: 15))
            }
            .padding(.horizontal, 8)
            
            Text("2d")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                .padding(.leading, 8)
                .padding(.top, 2)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
