//
//  NotificationCellViewModel.swift
//  InstagramSwiftUI
//
//  Created by Gustas on 2021-07-23.
//

import SwiftUI

class NotificationCellViewModel: ObservableObject {
    @Published var notification: Notification
    
    init(notification: Notification) {
        self.notification = notification
        checkIfUserIsFollowed()
        fetchNotificationPost()
        fetchNotificationUser()
    }
    
    func follow() {
        UserService.follow(uid: notification.uid) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            NotificationsViewModel.uploadNotification(toUid: self.notification.uid, type: .follow)
            self.notification.isFollowed = true
        }
    }
    
    func unfollow() {
        UserService.unfollow(uid: notification.uid) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
            self.notification.isFollowed = false
        }
    }
    
    func checkIfUserIsFollowed() {
        guard notification.type == .follow else { return }
        UserService.checkIfUserIsFollowed(uid: notification.uid) { (isFollowed) in
            self.notification.isFollowed = isFollowed
        }
    }
    
    func fetchNotificationPost() {
        guard let postId = notification.postId else { return }
        
        COLLECTION_POSTS.document(postId).getDocument { snapshot, _ in
            self.notification.post = try? snapshot?.data(as: Post.self)
        }
    }
    
    func fetchNotificationUser() {
        COLLECTION_USERS.document(notification.uid).getDocument { (snapshot, _) in
            self.notification.user = try? snapshot?.data(as: User.self)
            print(self.notification.user?.username)
        }
    }
}
