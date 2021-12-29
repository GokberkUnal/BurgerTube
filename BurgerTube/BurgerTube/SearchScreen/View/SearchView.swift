//
//  SearchView.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 23.12.2021.
//

import SwiftUI

struct SearchView: View {
    let searchedVideoInfo: [VideoInfo]
    
    var body: some View {
        if(searchedVideoInfo.isEmpty){
            Text("Bulamadık :(")
        }else{ NavigationView {
            VStack(spacing: 0) {
                    ScrollView {
                      
                            ForEach(searchedVideoInfo) { video in
                                VideoCard(videoInfo: video)
                            }
                        
                    }
                
              
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }}
        
        
    }
}

/*struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}*/
