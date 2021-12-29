//
//  ContentView.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 18.12.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        TabView {
                    FeedView()
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Home")
                }
                
                TrendView()
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Trends")
                }
               
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
