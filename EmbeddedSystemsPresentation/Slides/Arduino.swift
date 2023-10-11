//
//  Arduino.swift
//  EmbeddedSystemsPresentation
//
//  Created by Adin Ackerman on 10/8/23.
//

import Foundation
import SwiftUI
import PresentationKit

class Arduino: SlideModel {
    let name: String = "Arduino"
    let duration: CGFloat = 3
    let transition: PresentationKit.Transition = .fade
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            ArduinoView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct ArduinoView: SlideView {
    @EnvironmentObject var model: Arduino
    
    var t: CGFloat
    let scale: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Arduino")
                .font(.system(size: 400 * scale))
                .bold()
                .foregroundStyle(Color.init(red: 3/255, green: 130/255, blue: 133/255))
                .keyframeAnimator(initialValue: (100, 0), trigger: t >= 0, content: { content, value in
                    content
                        .blur(radius: value.0 * scale)
                        .opacity(value.1)
                }) { value in
                    KeyframeTrack(\.0) {
                        LinearKeyframe(0, duration: 5)
                    }
                    
                    KeyframeTrack(\.1) {
                        LinearKeyframe(1, duration: 5)
                    }
                }
                
            
            HStack {
                if t > 0 {
                    Image("arduino-uno-r3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 800 * scale, height: 800 * scale)
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                }
                
                if t > 1 {
                    Image("ard-mega2560r3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 800 * scale, height: 800 * scale)
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                }
            }
        }
    }
}

#Preview {
    Arduino()
        .view(t: 2, scale: 0.25)
        .frame(width: 960, height: 540)
        .background(.white)
}
