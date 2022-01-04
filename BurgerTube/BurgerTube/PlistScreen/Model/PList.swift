//
//  PList.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 3.01.2022.
//

import Foundation

struct PList: Identifiable, Codable {
    let id: String?
    let pName: String?
    let pDescription: String?
    var videoCount: Int
 
    
    var pNameOrDefault: String {
        return pName ?? "-"
    }
}



