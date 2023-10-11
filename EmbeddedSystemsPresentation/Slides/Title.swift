//
//  Title.swift
//  EmbeddedSystemsPresentation
//
//  Created by Adin Ackerman on 10/8/23.
//

import Foundation
import SwiftUI
import PresentationKit

class Title: SlideModel {
    let name: String = "Title"
    let duration: CGFloat = 2
    let transition: PresentationKit.Transition = .slide
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            TitleView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct TitleView: SlideView {
    @EnvironmentObject var model: Title
    
    var t: CGFloat
    var scale: CGFloat
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text("Embedded Systems")
                    .font(.system(size: 400 * scale))
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                    .offset(y: t >= 1 ? 0 : 100 * scale)
                    .opacity(t >= 1 ? 1 : 0)
                
                Text("ECE 196")
                    .font(.system(size: 150 * scale))
                    .fontWeight(.medium)
                    .foregroundStyle(.black.opacity(0.5))
                    .offset(y: t >= 1 ? 0 : 100 * scale)
                    .opacity(t >= 1 ? 1 : 0)
                    .animation(Presentation.animation.delay(0.1), value: t)
                
                Text("Adin Ackerman")
                    .font(.system(size: 100 * scale))
                    .fontWeight(.thin)
                    .italic()
                    .foregroundStyle(.black)
                    .offset(y: t >= 1 ? 0 : 100 * scale)
                    .opacity(t >= 1 ? 1 : 0)
                    .animation(Presentation.animation.delay(0.2), value: t)
            }
        }
    }
}

#Preview {
    Title()
        .view(t: 1, scale: 0.25)
        .frame(width: 960, height: 540)
        .background(.white)
}
