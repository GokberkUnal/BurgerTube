//
//  AdminViewModel.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 20.12.2021.
//

import Foundation
import SwiftUI




class AdminViewModel: ObservableObject {
    
    
    @Published var userName: String = ""
    @Published var userPassword: String = ""
    @Published var isActive = false
    
    func adminControll(){
        if(userName=="ADMIN"){
            if(userPassword=="ADMIN"){
                return isActive=true
                    
                }
            }

        }
    
}

