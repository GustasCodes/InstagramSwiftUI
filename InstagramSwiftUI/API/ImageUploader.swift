//
//  ImageUploader.swift
//  InstagramSwiftUI
//
//  Created by Gustas on 2021-07-20.
//

import UIKit
import Firebase

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.25) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { (_, error) in
            if let error = error {
                print("FAILED to upload image: \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { (url, _) in
                guard let imageUrl = url?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
