//
//  AdminDetailsView.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 24.12.2021.
//

import SwiftUI

struct AdminDetailsView: View {
    @StateObject var viewModel : AdminDetailsViewModel
    let videoInfo: VideoInfo
    
    init(videoInfo:VideoInfo){
        self.videoInfo = videoInfo
        self._viewModel = StateObject(wrappedValue: AdminDetailsViewModel(videoInfo: videoInfo))
        
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AdminPlaceholder(viewModel: viewModel,videoInfo: videoInfo)
                Spacer()
                Text(videoInfo.titleOrDefault)
                AdminActions(viewModel: viewModel,videoInfo: videoInfo)
                AdminSection(viewModel: viewModel)
            }
            .navigationTitle(videoInfo.titleOrDefault)
        }
    }
}

/*struct VideoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailsView(videoInfo: VideoInfo.stub())
            .preferredColorScheme(.dark)
    }
}*/

struct AdminActions: View {
    @ObservedObject var viewModel: AdminDetailsViewModel
    let videoInfo: VideoInfo
    
    var body: some View {
        HStack {
            Button {
                viewModel.like()
                
            } label: {
                Label {
                    Text("\(viewModel.publishedVideoInfo.like)")
                        .font(.caption)
                        .fontWeight(.semibold)
                } icon: {
                    Image(systemName: "hand.thumbsup.fill")
                }
            }
            .padding(10)
            
            Button {
                viewModel.dislike()
            } label: {
                Label {
                    Text("\(viewModel.publishedVideoInfo.dislike)")
                        .font(.caption)
                        .fontWeight(.semibold)
                } icon: {
                    Image(systemName: "hand.thumbsdown.fill")
                }
            }
            .padding(10)
            
            Spacer()
            Button {
                print("Video Edit button was tapped")
                viewModel.delVideos(currVideo: videoInfo)
            } label: {
                Label("Sil", systemImage: "trash")
            }
            
        }
    }
}



struct AdminSection: View {
    @ObservedObject var viewModel: AdminDetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
          
            HStack {
                Text("Comments")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
               

            }
            Divider()
            if viewModel.commentsLoading {
                AppProgressIndicator()
            }
            else {
                ForEach(viewModel.comments) { comment in
                    AdminCommentTile(comment: comment, viewModel: viewModel)
                    Divider()
                }
                
            }
        }
    }
}

// video gelecek buraya
struct AdminPlaceholder: View {
    @ObservedObject var viewModel: AdminDetailsViewModel
    var videoInfo: VideoInfo
    var body: some View {
        AsyncImage(url: URL(string: videoInfo.thumbnailOrDefault)) { image in
            image
                .resizable()
                .aspectRatio(16/9, contentMode: .fit)
        
        } placeholder: {
            ProgressView()
        }
         .padding(.vertical)
     
     
        
    }
}

