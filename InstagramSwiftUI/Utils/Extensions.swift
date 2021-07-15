//
//  Extensions.swift
//  InstagramSwiftUI
//
//  Created by Gustas on 2021-07-13.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
