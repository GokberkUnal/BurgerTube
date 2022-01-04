//
//  PListCard.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 3.01.2022.
//

import SwiftUI

struct PListCard: View {
    let pList: PList
    
    var body: some View {
        NavigationLink {
            
            PListFeedView(pList: pList)
      
        } label: {
            VStack {
               
                
                Text(pList.pName!)
                    .font(.title)
                    .frame(maxWidth: .infinity,alignment: .center)
                        
                    
             HStack {  Text(pList.pDescription!)
                     .frame(maxWidth: .infinity*0.5,alignment: .leading)
                 
                    .padding()
                
                
                Text("\(pList.videoCount)")
                     .frame(maxWidth: .infinity*0.5,alignment: .trailing).padding()
                  
                 
             }
                
            }.background(Color.pink).padding()
        }.tint(.white)
           

        
    }
}


