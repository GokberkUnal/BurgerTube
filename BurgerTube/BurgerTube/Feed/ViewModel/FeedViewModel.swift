//
//  FeedViewModel.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 12/19/21.
//
import Foundation
import SwiftUI
import Firebase


class FeedViewModel: ObservableObject {
    @Published var videos = [VideoInfo]()
    @Published var loading = false
    @Published var searchedVideos = [VideoInfo]()

    var popUpController=0
    init() {
        loadVideoInfos()
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
            else{
          
            }
        }
    }
    
    func search(for query: String) {
        
        
        
        let db = Firestore.firestore().collection("videos")
        
        db.whereField("title", isEqualTo: query).getDocuments { snapshot, e in
            
            
            if e == nil{
                if let snapshot = snapshot{
                    
                   
                        self.searchedVideos = snapshot.documents.map{ d in
                            return VideoInfo(id: d.documentID,title: d["title"] as? String ?? "",thumbnail:d["thumbnail"] as? String ?? "", like: d["like"] as! Int, dislike: d["dislike"] as! Int )
                        }
                        
                  
                    }
                print("bitti")
                   
                    
                
            }
               
                
    }
        
        
    }
    

    func addVideo(thumbnail:String,title:String) {
        
        objectWillChange.send()
        
        let db = Firestore.firestore()
        do{
            let newVideo = db.collection("videos").addDocument(data: ["title":title,"thumbnail":thumbnail,"like":0,"dislike":0])
            
            newVideo.collection("comments").document().setData(["comment":""])
            
        }
        loadVideoInfos()
        
        
    
}
    
   
    
    
}
 
    
        
    
    
