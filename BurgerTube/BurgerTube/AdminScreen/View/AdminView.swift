//
//  AdminView.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 20.12.2021.
//

import SwiftUI

struct AdminView: View {
     @StateObject var viewModel = AdminViewModel()
       let verticalPaddingForForm = 40.0
       var body: some View {
           ZStack {
               Color.red
               VStack(spacing: CGFloat(verticalPaddingForForm)) {
                   Text("Admin")
                       .font(.title)
                       .foregroundColor(Color.white)
                   HStack {
                      
                       TextField("Admin", text: $viewModel.userName)
                           .foregroundColor(Color.white)
                   }
                   .padding()
                   .background(Color.black)
                   .cornerRadius(10)
                   
                   HStack {
                       
                       SecureField("Şifre", text: $viewModel.userPassword)
                           .foregroundColor(Color.white)
                       
                   }
                   .padding()
                   .background(Color.black)
                   .cornerRadius(10)
                   
                  
                   
                   NavigationLink(destination:AdminFeedView()){
                       Text("Next").foregroundColor(.white)
                       
                   }.disabled(viewModel.isActive==false).onTapGesture {
                       viewModel.adminControll()
                   }.font(.subheadline)
                       .padding()
                       .background(Color(red: 0, green: 0, blue: 0))
                       .clipShape(Capsule())
                   
                   
                                         
                               
                               
                  
                   
               }.padding(.horizontal, CGFloat(verticalPaddingForForm))
               
           }
       };
}

struct AdminView_Previews: PreviewProvider {
    static var previews: some View {
        AdminView()
    }
}
