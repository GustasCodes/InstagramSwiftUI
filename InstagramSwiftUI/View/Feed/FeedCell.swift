//
//  FeedCell.swift
//  InstagramSwiftUI
//
//  Created by Gustas on 2021-07-02.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
    
    var didLike: Bool { return viewModel.post.didLike ?? false }
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if let user = viewModel.post.user {
                    NavigationLink(destination: ProfileView(user: user)) {
                        KFImage(URL(string: viewModel.post.ownerImageUrl))
                            .resizable()
                            .scaledToFill()
                            .frame(width: 26, height: 26)
                            .clipped()
                            .cornerRadius(18)
                        
                        Text(viewModel.post.ownerUsername)
                            .font(.system(size: 14, weight: .semibold))
                    }
                }
            }
            .padding([.leading, .bottom], 8)
            
            KFImage(URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: 440)
                .clipped()
            
            HStack(spacing: 16) {
                Button(action: {
                    didLike ? viewModel.unlike() : viewModel.like()
                }, label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFill()
                        .foregroundColor(didLike ? .red : .black)
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .clipped()
                        .padding(4)
                })
                
                NavigationLink(destination: CommentsView(post: viewModel.post)) {
                    Image(systemName: "bubble.right")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 20, height: 20)
                        .font(.system(size: 20))
                        .clipped()
                        .padding(4)
                }
                
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
            
            Text(viewModel.likeString)
                .font(.system(size: 14, weight: .semibold))
                .padding(.leading, 8)
                .padding(.bottom, 2)
            
            HStack {
                Text(viewModel.post.ownerUsername).font(.system(size: 14, weight: .semibold)) + Text(" ") + Text(viewModel.post.caption).font(.system(size: 15))
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
