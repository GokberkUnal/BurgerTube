//
//  TrendViewModel.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 23.12.2021.
//

import Foundation
import SwiftUI
import Firebase


class TrendViewModel: ObservableObject {
    @Published var videos = [VideoInfo]()
    @Published var loading = false
    var popUpController=0
    init() {
        loadVideoInfos()
    }
    
    func loadVideoInfos() {
        loading = true
        let db = Firestore.firestore()
        
        db.collection("videos").order(by: "like", descending: true).addSnapshotListener{ snapshot, e in
            
            
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
    

    

  
    
    
}
