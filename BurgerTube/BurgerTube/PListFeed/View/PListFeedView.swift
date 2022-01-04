//
//  PListFeedView.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 4.01.2022.
//

import SwiftUI

struct PListFeedView: View {
    @StateObject var viewModel : PListFeedViewModel
    let pList : PList
     
    init(pList:PList) {
        self.pList = pList
        self._viewModel = StateObject(wrappedValue: PListFeedViewModel(pList: pList))
        
    }
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                    ScrollView {
                        if viewModel.loading {
                            AppProgressIndicator()
                        }
                        else {
                            ForEach(viewModel.videos) { video in
                                VideoCard(videoInfo: video)
                            }
                        }
                    }
                
              
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        
        
    }
}



