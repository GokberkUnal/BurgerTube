//
//  FeedView.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 12/18/21.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                AppBar(viewModel: viewModel, title: "BurgerTube")
                    ScrollView {
                        if viewModel.loading {
                            AppProgressIndicator()
                        }
                        else {
                            ForEach(viewModel.videos) { video in
                                VideoCard(videoInfo: video)
                            }
                        }
                    }.onAppear {
                        viewModel.loadVideoInfos()
                        print("çalıştı")
                    }
                
              
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        
        
    }
}


struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
            .preferredColorScheme(.dark)
    }
}


struct AppBar: View {
    // TODO: refactor if elses
    @ObservedObject var viewModel: FeedViewModel
    @State var searchFillsAppbar = false
    @State var queryText: String = ""
    @State private var isActive = false
    
    let title: String
    var body: some View {
        HStack {
            if searchFillsAppbar {
                Button {
                    withAnimation {
                        searchFillsAppbar.toggle()
                    }
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                }

            }
            else {
                PopupMenu(viewmodel: viewModel)
            }
            
            if searchFillsAppbar {
                TextField("Search", text: $queryText)
                    .frame(maxWidth: .infinity, alignment: .leading)
            } else {
                HStack {
                    Text(title)
                        .font(.body.bold())
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            
            Button{
               
                if searchFillsAppbar {
                    viewModel.search(for: queryText)
                    self.isActive=true
                    
                }
                else {
                    withAnimation {
                        searchFillsAppbar.toggle()
                        
                    }
                    
                }
               
            }label:{
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
            }.background(
                NavigationLink(destination: SearchView(searchedVideoInfo:viewModel.searchedVideos), isActive: $isActive) {
                    EmptyView()
                })
        }
        .padding()
        .background(.red)
        
    }
    
    
}
