//
//  AdminCommentTile.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 24.12.2021.
//

import SwiftUI

struct AdminCommentTile: View {
    let comment: Comment
    @StateObject var viewModel : AdminDetailsViewModel
   
    
    var body: some View {
        HStack {
            Circle()
                .fill(.blue)
                .frame(width: 35, height: 35)
            Text(comment.textOrDefault)
            Spacer()
            Button {
                print("Edit button was tapped")
                viewModel.delComment(currComment: comment)
            } label: {
                Label("Sil", systemImage: "trash")
            }
            
        }
    }
}

/*struct AdminCommentTile_Previews: PreviewProvider {
    static var previews: some View {
        AdminCommentTile()
    }
}*/
