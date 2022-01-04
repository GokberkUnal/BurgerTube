//
//  NewPListView.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 3.01.2022.
//

import SwiftUI

struct NewPListView: View {
    @ObservedObject var vm:PListViewModel
    @State var pListName: String = ""
    @State var pListDescription: String = ""
    
       let verticalPaddingForForm = 40.0
       var body: some View {
           ZStack {
               Color.red
               VStack(spacing: CGFloat(verticalPaddingForForm)) {
                   Text("Yeni PlayList")
                       .font(.title)
                       .foregroundColor(Color.white)
                 
                    TextField("PlayList Adı", text: $pListName)
                           .foregroundColor(Color.white).padding()
                           .background(Color.black)
                           .cornerRadius(10)
                   TextField("PlayList Açıklaması", text: $pListDescription)
                       .foregroundColor(Color.white)
                       
                .padding()
                   .background(Color.black)
                   .cornerRadius(10)
                   
                   
                   Button {
                       vm.addPList(pNameController: pListName,pDescriptionController: pListDescription)
                     
                   } label: {
                       Text("Add")
                           .font(.subheadline)
                           .fontWeight(.semibold)
                           .foregroundColor(.white)
                           .padding()
                           .background(Color(red: 0, green: 0, blue: 0))
                           .clipShape(Capsule())
                           
                   }
                
                   
               }.padding(.horizontal, CGFloat(verticalPaddingForForm))
               
           }
       };
}


