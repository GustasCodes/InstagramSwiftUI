//
//  ProfileViewModel.swift
//  InstagramSwiftUI
//
//  Created by Gustas on 2021-07-21.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User
    
    init(user: User) {
        self.user = user
        checkIfUserIsFollowed()
    }
    
    func follow() {
        guard let uid = user.id else { return }
        UserService.follow(uid: uid) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            NotificationsViewModel.uploadNotification(toUid: uid, type: .follow)
            
            self.user.isFollowed = true
        }
    }
    
    func unfollow() {
        guard let uid = user.id else { return }
        UserService.unfollow(uid: uid) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
            self.user.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard !user.isCurrentUser else { return }
        guard let uid = user.id else { return }
        UserService.checkIfUserIsFollowed(uid: uid) { (isFollowed) in
            self.user.isFollowed = isFollowed
        }
    }
}

