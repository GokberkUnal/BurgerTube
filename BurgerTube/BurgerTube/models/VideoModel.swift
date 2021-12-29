//
//  VideoModel.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 18.12.2021.
//

import Foundation

struct VideoModel:Identifiable,Codable{
    let id:Int
    let videoUrl:String
    let title:String
    let channel:String
    var like:Int
    var dislike:Int
    var comments:[CommentsModel]
    
   
   
}
