
//
//  FeedViewModel.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 12/19/21.
//
import Foundation
import SwiftUI
import Firebase


class AdminFeedViewModel: ObservableObject {
    @Published var videos = [VideoInfo]()
    @Published var loading = false
    @Published var searchedVideos = [VideoInfo]()

    var popUpController=0
    init() {
        
        
    }
    
    func loadVideoInfos() {
        loading = true
        let db = Firestore.firestore()
        
        db.collection("videos").getDocuments { snapshot, e in
            
            
            if e == nil{
                if let snapshot = snapshot{
                    
                   
                        self.videos = snapshot.documents.map{ d in
                            return VideoInfo(id: d.documentID,title: d["title"] as? String ?? "",thumbnail:d["thumbnail"] as? String ?? "", like: d["like"] as! Int, dislike: d["dislike"] as! Int )
                        }
                        
                        self.loading = false
                    }
                   
                    
                
            }
            
        }
    }
    
    
    
    
}
 
    
        
    
    
