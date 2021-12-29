//
//  VideoInfo.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 12/19/21.
//

import Foundation


struct VideoInfo: Identifiable, Codable {
    let id: String?
    let title: String?
    let thumbnail: String?
    var like:Int
    var dislike:Int
    
    var titleOrDefault: String {
        return title ?? "-"
    }
    
    var thumbnailOrDefault: String {
        return thumbnail ?? "-"
    }
}

extension VideoInfo {
    static func stub() -> Self {
        return Self(id: "0",title: "Super Saiyan 2 Goku Vs Ultimate Gohan | Dragon Ball Super [English Dub]",
                    thumbnail:  "https://i.ytimg.com/vi/t3Kzp_5TSIA/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCq6lYBTCh6ohgdBzjv5AAhN8_N_A",like: 0,dislike: 0)
    
    }
}
