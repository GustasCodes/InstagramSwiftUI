//
//  UserCell.swift
//  InstagramSwiftUI
//
//  Created by Gustas on 2021-07-13.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image("portrait")
                .resizable()
                .scaledToFill()
                .frame(width: 48, height: 48)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text("portrait")
                    .font(.system(size: 14, weight: .semibold))
                
                Text("Bruce Wayne")
                    .font(.system(size: 14))
            }
            
            Spacer()
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
