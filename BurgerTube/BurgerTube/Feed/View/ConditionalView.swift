//
//  ConditionalView.swift
//  BurgerTube
//
//  Created by Gürhan Kuraş on 12/18/21.
//

import SwiftUI

struct ConditionalView<Content: View, OtherContent: View> : View {
    let condition: Binding<Bool>
    let content: Content
    let other: OtherContent
    
    init(if condition: Binding<Bool>, @ViewBuilder content: () -> Content, @ViewBuilder other: () -> OtherContent) {
        self.content = content()
        self.other = other()
        self.condition = condition
    }
    var body: some View {
        if condition.wrappedValue {
            content
        }
        else {
            other
        }
    }
}
