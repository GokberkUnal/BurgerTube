//
//  PListViewModel.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 3.01.2022.
//

import Foundation
import Firebase

class PListViewModel: ObservableObject {
    @Published var pList = [PList]()
    @Published var loading = false
    @Published var pListLoading = false



    init() {
        loadPLists()
        
    }
    
    func loadPLists() {
        self.pListLoading=true
       
        let db = Firestore.firestore()
        
        db.collection("playlists").getDocuments { snapshot, e in
          
            
            if e == nil{
                if let snapshot = snapshot{
                    
                   
                        self.pList = snapshot.documents.map{ d in
                            return PList(id: d.documentID, pName: d["pName"] as? String ?? "",pDescription: d["pDescription"] as? String ?? "",videoCount: d["videoCount"] as! Int)
                            
                        }
                        
                        self.loading = false
                    }
                
            }
        }
    }

        
    
  

    func addPList(pNameController:String,pDescriptionController:String) {
        
        objectWillChange.send()
        
        let db = Firestore.firestore()
        do{
            let newPList = db.collection("playlists").addDocument(data: ["pName":pNameController,"pDescription":pDescriptionController,"videoCount":0])
            
            newPList.collection("videos").document().setData(["videoId":"FIj4Spl2dPJXX81Z91lB"])
            
        }
        loadPLists()

       

      }
}
