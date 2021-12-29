//
//  AdminVideoCardView.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 24.12.2021.
//

import SwiftUI

struct AdminVideoCard: View {
    let videoInfo: VideoInfo
    
    var body: some View {
        NavigationLink {
            AdminDetailsView(videoInfo: videoInfo)
        } label: {
            VStack {
                AsyncImage(url: URL(string: videoInfo.thumbnailOrDefault)) { image in
                    image
                        .resizable()
                        .aspectRatio(16/9, contentMode: .fit)
                       
                    
                } placeholder: {
                    ProgressView()
                }
                .padding(.vertical)
                
                Text(videoInfo.title!)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading).foregroundColor(.white)
                    
            }
        }.tint(.white)

        
    }
}


