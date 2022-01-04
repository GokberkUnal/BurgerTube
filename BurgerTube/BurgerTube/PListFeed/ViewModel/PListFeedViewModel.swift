//
//  PListFeedView.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 4.01.2022.
//

import Foundation
import SwiftUI
import Firebase


class PListFeedViewModel: ObservableObject {
    @Published var publishedPList:PList
    @Published var videos = [VideoInfo]()
    @Published var loading = false
    @Published var pListInfos=[PListInfo]()


    
    init(pList:PList) {
        self._publishedPList = Published(initialValue: pList )
        loadPListInfos()

    }
    
    func loadPListInfos() {
        loading = true
        let db = Firestore.firestore()
        
        db.collection("playlists").document(publishedPList.id ?? "").collection("videos").getDocuments { snapshot, e in
            
     
            if e == nil{
                if let snapshot = snapshot{
                    
             
                        self.pListInfos = snapshot.documents.map{ d in
                            
                            let pListIndex=PListInfo(id: d.documentID , videosId: d["videoId"] as? String ?? "" )
                      
                                db.collection("videos").document(d["videoId"] as? String ?? "").getDocument { (videosnapshot, error) in
                                    
                                    if error == nil{
                                        if let videosnapshot=videosnapshot{
                                           let video = VideoInfo(id: videosnapshot.documentID,title: videosnapshot["title"] as? String ?? "",thumbnail:videosnapshot["thumbnail"] as? String ?? "", like: videosnapshot["like"] as! Int, dislike: videosnapshot["dislike"] as! Int )
                                            self.videos.append(video)
                                        }
                                
                                    }
                                }
                            return pListIndex
                        }
                }
                self.loading=false
            }
        }
    }
}
    
