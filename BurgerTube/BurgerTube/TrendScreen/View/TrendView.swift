//
//  TrendView.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 23.12.2021.
//

import SwiftUI

struct TrendView: View {
    @StateObject var viewModel = TrendViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                TrendAppBar(title: "BurgerTube")
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

struct TrendView_Previews: PreviewProvider {
    static var previews: some View {
        TrendView()
    }
}

struct TrendAppBar: View {
 
    
    let title: String
    var body: some View {
        HStack {
            
                
                    Text(title)
                        .font(.body.bold())
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
               
            }
            
        .padding()
        .background(.red)
        
    }
    
 

}
