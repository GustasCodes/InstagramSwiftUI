//
//  FeedView.swift
//  InstagramSwiftUI
//
//  Created by Gustas on 2021-07-02.
//

import SwiftUI

struct FeedView: View {
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 32) {
                ForEach(viewModel.posts) { post in
                    FeedCell(viewModel: FeedCellViewModel(post: post))
                }
            }
            .padding(.top)
        }
    }
}
