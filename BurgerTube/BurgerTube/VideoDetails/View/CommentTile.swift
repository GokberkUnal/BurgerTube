//
//  CommentTile.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal  on 12/19/21.
//

import SwiftUI

struct CommentTile: View {
    let comment: Comment
    
    init(_ comment: Comment) {
        self.comment = comment
    }
    var body: some View {
        HStack {
            Circle()
                .fill(.blue)
                .frame(width: 35, height: 35)
            Text(comment.textOrDefault)
        }
    }
}

struct CommentTile_Previews: PreviewProvider {
    static var previews: some View {
        CommentTile(Comment.stub())
    }
}
