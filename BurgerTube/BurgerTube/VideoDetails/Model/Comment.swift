//
//  Comment.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 12/19/21.
//

import Foundation

struct Comment: Identifiable, Codable {
    let id: String?
    let text: String?
    
    
    var textOrDefault: String {
        text ?? "-"
    }
    
  
}


extension Comment {
    static func stub() -> Self {
        Self(id: "1", text: "Cok begendim")
    }
}
