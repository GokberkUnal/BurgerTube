//
//  AdminFeedView.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 24.12.2021.
//

import SwiftUI

struct AdminFeedView: View {
    @StateObject var viewModel = TrendViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                    ScrollView {
                        if viewModel.loading {
                            AppProgressIndicator()
                        }
                        else {
                            ForEach(viewModel.videos) { video in
                                AdminVideoCard(videoInfo: video)
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
