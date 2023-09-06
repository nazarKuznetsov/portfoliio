//
//  CircleButtonAnimationView.swift
//  MyCrypto
//
//  Created by Admin on 29.08.2023.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @Binding var animated: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animated ? 1.0 : 0.0)
            .opacity(animated ? 0.0 : 1.0)
//            .animation(animated ? Animation.easeOut(duration: 1), value: .none)
            .animation(.easeOut(duration: 1), value: animated)
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animated: .constant(false))
    }
}
