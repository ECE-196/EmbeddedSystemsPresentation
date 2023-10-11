//
//  Code.swift
//  EmbeddedSystemsPresentation
//
//  Created by Adin Ackerman on 10/11/23.
//

import Foundation
import SwiftUI
import PresentationKit

class Code: SlideModel {
    let name: String = "Code"
    let duration: CGFloat = 6
    let transition: PresentationKit.Transition = .fade
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            CodeView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct CodeView: SlideView {
    @EnvironmentObject var model: Code
    
    var t: CGFloat
    let scale: CGFloat
    
    var body: some View {
        VStack {
            if t > 4 {
                Rust()
                    .frame(width: 800 * scale, height: 800 * scale)
                    .transition(.move(edge: .bottom).combined(with: .scale))
            }
            
            HStack {
                if t > 0 {
                    Image("circuitpython")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400 * scale, height: 400 * scale)
                        .transition(.scale.combined(with: .opacity))
                }
                
                if t > 1 {
                    Image("arduino")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400 * scale, height: 400 * scale)
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                }
                
                if t > 2 {
                    Image("c")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400 * scale, height: 400 * scale)
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                }
                
                if t > 3 {
                    Image("nordic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400 * scale, height: 400 * scale)
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                }
            }
            .scaleEffect(t > 4 ? 0.8 : 1)
            .saturation(t > 4 ? 0.5 : 1)
        }
        .animation(t == 5 ? .smooth(duration: 2) : Presentation.animation, value: t)
    }
}

#Preview {
    Code()
        .view(t: 5, scale: 0.25)
        .frame(width: 960, height: 540)
        .background(.white)
}
