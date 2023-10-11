//
//  What.swift
//  EmbeddedSystemsPresentation
//
//  Created by Adin Ackerman on 10/8/23.
//

import Foundation
import SwiftUI
import PresentationKit

class What: SlideModel {
    let name: String = "What"
    let duration: CGFloat = 3
    let transition: PresentationKit.Transition = .slide
    
    func view(t: CGFloat, scale: CGFloat) -> AnyView {
        AnyView(
            WhatView(t: t, scale: scale)
                .environmentObject(self)
        )
    }
}

struct WhatView: SlideView {
    @EnvironmentObject var model: What
    
    var t: CGFloat
    var scale: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 0) {
                if t > 0 {
                    Text("What is a ")
                        .font(.system(size: 150 * scale))
                        .foregroundStyle(.black)
                        .transition(.move(edge: .leading).combined(with: .opacity))
                }
                
                Text("Microcontroller")
                    .font(.system(size: 150 * scale))
                    .bold()
                    .foregroundStyle(.black)
                
                if t > 0 {
                    Text("?")
                        .font(.system(size: 150 * scale))
                        .foregroundStyle(.black)
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                }
            }
            .padding(t <= 1 ? 100 * scale : 50 * scale)
            .scaleEffect(t <= 1 ? 1 : 0.8)
            
            if t > 1 {
                Text("*A microcontroller (MCU for microcontroller unit) is a small computer on a single VLSI integrated circuit (IC) chip. A microcontroller contains one or more CPUs (processor cores) along with memory and programmable input/output peripherals. Program memory in the form of ferroelectric RAM, NOR flash or OTP ROM is also often included on chip, as well as a small amount of RAM. Microcontrollers are designed for embedded applications, in contrast to the microprocessors used in personal computers or other general purpose applications consisting of various discrete chips.*")
                    .font(.system(size: 50 * scale))
                    .fontWeight(.light)
                    .foregroundStyle(.black)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 100 * scale)
                    .transition(.offset(y: 100 * scale).combined(with: .opacity))
            }
        }
    }
}

#Preview {
    What()
        .view(t: 1, scale: 0.25)
        .frame(width: 960, height: 540)
        .background(.white)
}
