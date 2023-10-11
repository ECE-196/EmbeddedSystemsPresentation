//
//  Rust.swift
//  EmbeddedSystemsPresentation
//
//  Created by Adin Ackerman on 10/11/23.
//

import SwiftUI

struct Rust: View {
    @State private var angle: CGFloat = 0
    
    var body: some View {
        ZStack {
            Image("Rust Logo R")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Image("Rust Logo Gear")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(angle))
        }
        .onAppear {
            withAnimation(.linear(duration: 40).repeatForever(autoreverses: false)) {
                angle = 360
            }
        }
    }
}

#Preview {
    Rust()
}
