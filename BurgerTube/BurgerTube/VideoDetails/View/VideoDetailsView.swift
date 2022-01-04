//
//  VideoDetailsView.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 12/18/21.
//

import SwiftUI


struct VideoDetailsView: View {
    @StateObject var viewModel : VideoDetailsViewModel
    let videoInfo: VideoInfo
    
    init(videoInfo:VideoInfo){
        self.videoInfo = videoInfo
        self._viewModel = StateObject(wrappedValue: VideoDetailsViewModel(videoInfo: videoInfo))
        
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VideoPlaceholder(viewModel: viewModel,videoInfo: videoInfo)
                Spacer()
                Text(videoInfo.titleOrDefault)
                VideoActions(viewModel: viewModel)
                CommentsSection(viewModel: viewModel)
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

struct VideoActions: View {
    @ObservedObject var viewModel: VideoDetailsViewModel
    
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
            Menu{
                
                ForEach(viewModel.pListVM.pList) { pList in
                    Button(pList.pName ?? "", action:{ if(pList.videoCount<10){viewModel.addToPlayList(playList: pList, videoId: viewModel.publishedVideoInfo.id ?? "")}
                        else{
                            viewModel.ifIsFull(true)
                        }
                       
                    }
                    )
                }
                    
            }label: {
                Label {

                } icon: {
                    Image(systemName: "plus")
                }
            }
            
        }.alert("Liste Dolu!",
                  isPresented: $viewModel.showErrorMessage) {
                       Button("tamam", role: .cancel) { }
        }
    }
}


struct AddCommentSection: View {
    @Binding var text: String
    var body: some View {
        ZStack {
            TextEditor(text: $text)
                .disableAutocorrection(true)
            Text(text).opacity(0).padding(.all, 8)
        }
        .frame(maxHeight: 100)
        .cornerRadius(10)
        .border(Color(.systemGray5))
        .font(.caption)
    }
}

struct CommentsSection: View {
    @ObservedObject var viewModel: VideoDetailsViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            AddCommentSection(text: $viewModel.commentText)
            HStack {
                Text("Comments")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Spacer()
                Button {
                    viewModel.addComment()
                } label: {
                    Text("Add")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                        .padding(.trailing, 5)
                }

            }
            Divider()
            if viewModel.commentsLoading {
                AppProgressIndicator()
            }
            else {
                ForEach(viewModel.comments) { comment in
                    CommentTile(comment)
                    Divider()
                }
                
            }
        }
    }
}

// video gelecek buraya
struct VideoPlaceholder: View {
    @ObservedObject var viewModel: VideoDetailsViewModel
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

