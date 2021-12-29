//
//  AppProgressIndicator.swift
//  BurgerTube
//
//  Created by Orhan Gökberk Ünal on 12/19/21.
//

import SwiftUI

struct AppProgressIndicator: View {
    var body: some View {
        ProgressView()
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
    }
}

struct AppProgressIndicator_Previews: PreviewProvider {
    static var previews: some View {
        AppProgressIndicator()
    }
}
