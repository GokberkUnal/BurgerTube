//
//  PListView.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 3.01.2022.
//

import SwiftUI

struct PListView: View {
    
    @StateObject var viewModel = PListViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                PListAppBar(viewModel: viewModel,title: "BurgerTube")
                    ScrollView {
                        if viewModel.loading {
                            AppProgressIndicator()
                        }
                        else {
                            ForEach(viewModel.pList) { plist in
                                PListCard(pList: plist)
                            }
                        }
                    }
                
              
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
        
        
    }
}



struct PListAppBar: View {
 
    @ObservedObject var viewModel: PListViewModel
    
    let title: String
    var body: some View {
        HStack {
            
                
                    Text(title)
                        .font(.body.bold())
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
            
            
            Spacer()
            NavigationLink(destination: {NewPListView(vm: viewModel)}) {
                Image(systemName: "plus")
                }
               
            }
            
        .padding()
        .background(.red)
        
    }
    
 

}
