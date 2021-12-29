//
//  AdminDetailsViewModel.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 24.12.2021.
//

import Foundation
import Firebase


class AdminDetailsViewModel: ObservableObject {
    @Published var commentText: String = ""
    @Published var comments = [Comment]()
    @Published var commentsLoading = false
    @Published var publishedVideoInfo:VideoInfo


    
    init(videoInfo:VideoInfo){
        self._publishedVideoInfo = Published(initialValue: videoInfo)
        
        loadData()
        loadComments()
    }
    
   
    
    func loadData() {
       
        
    }
    
    
    func loadComments() {
        self.commentsLoading=true
       
        let db = Firestore.firestore().collection("videos").document(publishedVideoInfo.id ?? "")
        
        db.collection("comments").getDocuments { snapshot, e in
            
            
            if e == nil{
                if let snapshot = snapshot{
                    
                   
                        self.comments = snapshot.documents.map{ d in
                            return Comment(id: d.documentID , text: d["comment"] as? String ?? "" )
                        }
                        
                    self.commentsLoading = false
                    }
                   
                    
                
            }
               
                
    }
        
    }
    
    
    func like() {
        objectWillChange.send()
        let db = Firestore.firestore().collection("videos").document(publishedVideoInfo.id ?? "")
        
        db.updateData(["like": publishedVideoInfo.like+1])
        publishedVideoInfo = VideoInfo(id: publishedVideoInfo.id, title: publishedVideoInfo.title, thumbnail: publishedVideoInfo.thumbnail, like: publishedVideoInfo.like+1, dislike: publishedVideoInfo.dislike)
        
        
        
    }
    
    func dislike() {
        objectWillChange.send()
        let db = Firestore.firestore().collection("videos").document(publishedVideoInfo.id ?? "")
        
        db.updateData(["dislike": publishedVideoInfo.like+1])
        publishedVideoInfo = VideoInfo(id: publishedVideoInfo.id, title: publishedVideoInfo.title, thumbnail: publishedVideoInfo.thumbnail, like: publishedVideoInfo.like, dislike: publishedVideoInfo.dislike+1)
        
    }
    
    func delComment(currComment: Comment){
        objectWillChange.send()
        let db = Firestore.firestore()
        let _ = db.collection("videos").document(publishedVideoInfo.id ?? "").collection("comments").document(currComment.id ?? "").delete()
        loadComments()
        
    }
    func delVideos(currVideo: VideoInfo){
        objectWillChange.send()
        let db = Firestore.firestore()
        let _ = db.collection("videos").document(publishedVideoInfo.id ?? "").collection("comments").document().delete()
        let _ = db.collection("videos").document(publishedVideoInfo.id ?? "").delete()
        
        
    }
   

}
