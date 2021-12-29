//
//  PopupMenu.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 12/18/21.
//

import SwiftUI

struct PopupMenu: View {
    @State private var navigateTo = ""
    @State private var isActive = false
    @ObservedObject var viewmodel:FeedViewModel
    
    var body: some View {
HStack{
    NavigationLink(destination: {NewVideo(vm: viewmodel)}, label: {
                Text("+")
            }).padding(.trailing)
    
        
        NavigationLink(destination:{ AdminView()}) {
                Text("A")
            }
                }
            
        
        
       
        
    }
}

