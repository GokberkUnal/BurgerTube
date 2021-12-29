//
//  VideoCard.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 12/18/21.
//

import SwiftUI

struct VideoCard: View {
    let videoInfo: VideoInfo
    
    var body: some View {
        NavigationLink {
            VideoDetailsView(videoInfo: videoInfo)
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

struct VideoCard_Previews: PreviewProvider {
    static var previews: some View {
        VideoCard(videoInfo: VideoInfo.stub())
    }
}
