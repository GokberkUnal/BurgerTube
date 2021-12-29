//
//  NewVideo.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 19.12.2021.
//

import SwiftUI

struct NewVideo: View {
    @ObservedObject var vm:FeedViewModel
    @State var videoThumb: String = ""
    @State var videoTitle: String = ""
       let verticalPaddingForForm = 40.0
       var body: some View {
           ZStack {
               Color.red
               VStack(spacing: CGFloat(verticalPaddingForForm)) {
                   Text("Yeni video ekle")
                       .font(.title)
                       .foregroundColor(Color.white)
                   HStack {
                      
                       TextField("Video urlsi", text: $videoThumb)
                           .foregroundColor(Color.white)
                   }
                   .padding()
                   .background(Color.black)
                   .cornerRadius(10)
                   
                   HStack {
                       
                       TextField("Video başlığı", text: $videoTitle)
                           .foregroundColor(Color.white)
                       
                   }
                   .padding()
                   .background(Color.black)
                   .cornerRadius(10)
                   
                   Button {
                       vm.addVideo(thumbnail: videoThumb, title: videoTitle)
                       videoThumb=""
                       videoTitle=""
                   } label: {
                       Text("Add")
                           .font(.subheadline)
                           .fontWeight(.semibold)
                           .foregroundColor(.blue)
                           .padding(.trailing, 5)
                   }
                
                   
               }.padding(.horizontal, CGFloat(verticalPaddingForForm))
               
           }
       };
    }


